#include <stdio.h>
#include <stdlib.h>

typedef struct
{
    char nome[30];
    long long int cpf;
} Pessoa;

typedef struct
{
    char modelo[20], placa[8];
    long long int cpf_proprietario, renavam;
} Veiculo;

void listaPessoas()
{
    system("clear||cls");
    Pessoa pessoa;
    FILE *arquivo;
    arquivo = fopen("pessoas.bin", "rb");
    printf("\n--- PESSOAS CADASTRADAS ---\n");
    if (arquivo != NULL)
    {
        printf("|     CPF     |     Nome\n");
        while (!feof(arquivo) && fread(&pessoa, sizeof(Pessoa), 1, arquivo) == 1)
        {
            printf("| %-011lld | %s \n", pessoa.cpf, pessoa.nome);
        }
        fclose(arquivo);
    }
    else
    {
        printf("Nenhum registro encontrado.\n");
    }
    printf("\n----------------------------\n");
}

// Retorna -1 se o CPF já estiver cadastrado.
long int getPosicaoInsercaoPessoa(long long int novo_cpf)
{
    long int posicao = 0;
    int encontrou = 0;
    FILE *arquivo;
    arquivo = fopen("pessoas.bin", "rb");
    Pessoa pessoa;
    while (!feof(arquivo) && fread(&pessoa, sizeof(Pessoa), 1, arquivo) == 1 && encontrou == 0)
    {
        if (pessoa.cpf == novo_cpf)
        {
            fclose(arquivo);
            return -1;
        }
        else if (pessoa.cpf < novo_cpf)
        {
            posicao++;
        }
        else
        {
            encontrou = 1;
            fclose(arquivo);
        }
    }
    return posicao;
}

long int getPosicaoInsercaoVeiculo(long long int novo_renavam)
{
    long int posicao = 0;
    int encontrou = 0;
    FILE *arquivo;
    arquivo = fopen("veiculos.bin", "rb");
    Veiculo veiculo;
    while (!feof(arquivo) && fread(&veiculo, sizeof(Pessoa), 1, arquivo) == 1 && encontrou == 0)
    {
        if (veiculo.renavam == novo_renavam)
        {
            fclose(arquivo);
            return -1;
        }
        else if (veiculo.renavam < novo_renavam)
        {
            posicao++;
        }
        else
        {
            encontrou = 1;
            fclose(arquivo);
        }
    }
    return posicao;
}

void shiftArquivo(int posicaoInicial, char tipoArquivo) // tipoArquivo = 'p' ou 'v' -> Pessoas ou veículos.
{
    char *nomeArquivo;
    int tamanhoDaStruct;

    if (tipoArquivo == 'p')
    {
        nomeArquivo = "pessoas.bin";
        tamanhoDaStruct = sizeof(Pessoa);
    }
    else
    {
        nomeArquivo = "veiculos.bin";
        tamanhoDaStruct = sizeof(Veiculo);
    }

    FILE *ponteiroLeitura = fopen(nomeArquivo, "rb");
    FILE *ponteiroEscrita = fopen(nomeArquivo, "r+b");
    Pessoa pessoa;

    fseek(ponteiroLeitura, 0, SEEK_END); // Move o ponteiro para o final para contar a quantidade de registros.
    long int qtdPessoas = ftell(ponteiroLeitura) / tamanhoDaStruct;
    long int qtdIteracoes = qtdPessoas - posicaoInicial;

    fseek(ponteiroLeitura, -tamanhoDaStruct, SEEK_END);
    fseek(ponteiroEscrita, 0, SEEK_END);

    for (int i = 0; i < qtdIteracoes; i++)
    {
        fread(&pessoa, tamanhoDaStruct, 1, ponteiroLeitura);
        fwrite(&pessoa, tamanhoDaStruct, 1, ponteiroEscrita); // O cursor andou uma posição para ler/escrever.
        fseek(ponteiroEscrita, -2 * tamanhoDaStruct, SEEK_CUR);
        fseek(ponteiroLeitura, -2 * tamanhoDaStruct, SEEK_CUR); // Volta para o registro antecessor.
    }
}

void cadastraVeiculo()
{
    FILE *arquivo;
    Veiculo veiculo;
    arquivo = fopen("veiculos.bin", "ab");

    printf("Insira os dados do veiculo:\n");

    printf("CPF do proprietario:");
    scanf(" %lld", &veiculo.cpf_proprietario);
    fflush(stdin);
    if (getPosicaoInsercaoPessoa(veiculo.cpf_proprietario) != -1)
    {
        printf("CPF nao cadastrado. Cadastre o dono do veiculo.\n");
        return;
    }

    printf("Modelo do veiculo:");
    gets(veiculo.modelo);

    printf("Placa do veiculo:");
    gets(veiculo.placa);

    printf("Renavam:");
    scanf(" %lld", &veiculo.renavam);
    fflush(stdin);
    long int posicao = getPosicaoInsercaoVeiculo(veiculo.renavam);

    if (posicao == -1)
    {
        printf("\t\tErro: Veiculo ja cadastrado.\n");
        return;
    }
    else
    {
        shiftArquivo(posicao, 'p');
        fseek(arquivo, posicao * sizeof(Pessoa), SEEK_SET);
        fwrite(&veiculo, sizeof(Pessoa), 1, arquivo);
        fclose(arquivo);
        fwrite(&veiculo, sizeof(Veiculo), 1, arquivo);
        fclose(arquivo);
    }
}

void cadastraPessoa()
{
    FILE *arquivo;
    arquivo = fopen("pessoas.bin", "r+b");

    system("clear||cls");

    Pessoa pessoa;
    printf("Insira os dados da pessoa:\n");

    printf("Nome: ");
    gets(pessoa.nome);

    printf("CPF: ");
    scanf(" %lld", &pessoa.cpf);
    fflush(stdin);
    long int posicao;
    posicao = getPosicaoInsercaoPessoa(pessoa.cpf);
    if (posicao == -1)
    {
        printf("\t\tErro: Pessoa ja cadastrada.\n");
        return;
    }
    else
    {
        shiftArquivo(posicao, 'p');
        fseek(arquivo, posicao * sizeof(Pessoa), SEEK_SET);
        fwrite(&pessoa, sizeof(Pessoa), 1, arquivo);
        fclose(arquivo);
    }
}

void listaVeiculos()
{
    system("clear||cls");
    FILE *arquivo;
    arquivo = fopen("veiculos.bin", "rb");
    printf("\n--- VEICULOS CADASTRADOS ---\n");
    Veiculo veiculo;
    if (arquivo != NULL)
    {
        printf(" RENAVAM   | CPF do proprietario |       Modelo       | Placa\n");
        while (!feof(arquivo) && fread(&veiculo, sizeof(Veiculo), 1, arquivo) == 1)
        {
            printf("%09lld | %-21lld | %-20s | %s\n", veiculo.renavam, veiculo.cpf_proprietario, veiculo.modelo, veiculo.placa);
        }
        fclose(arquivo);
    }
    else
    {
        printf("Nenhum registro encontrado.\n");
    }
    printf("\n----------------------------\n");
}

void criaArquivos()
{
    FILE *pessoas, *veiculos;
    pessoas = fopen("pessoas.bin", "ab"); // O modo append (a) cria o arquivo apenas se não existir.
    veiculos = fopen("veiculos.bin", "ab");
    fclose(pessoas);
    fclose(veiculos);
}

int main()
{
    criaArquivos();
    char opcao;
    do
    {
        printf("Escolha uma opcao: \n1- Cadastrar uma pessoa.\n2- Cadastrar um veiculo.\n3- Listar veiculos.\n4- Listar pessoas.\n5- Sair\n");
        scanf("%c", &opcao);
        fflush(stdin);
        switch (opcao)
        {
        case '1':
            cadastraPessoa();
            break;
        case '2':
            cadastraVeiculo();
            break;
        case '3':
            listaVeiculos();
            break;
        case '4':
            listaPessoas();
            break;
        case '5':
            printf("Programa encerrado com sucesso.");
            break;
        default:
            printf("Digite uma opcao valida!\n");
        }
    } while (opcao != '5');
}
