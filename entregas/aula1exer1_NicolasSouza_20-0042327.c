#include <stdio.h>
#include <stdlib.h>

typedef struct  {
    char cpf[15], nome[30], email[20];
} Pessoa;

typedef struct {
    char renavam[11], cpfProprietario[15], marca[20], modelo[20], placa[8];
} Veiculo;

void cadastraVeiculo() {
    FILE *arquivo;
    Veiculo veiculo;
    arquivo = fopen("veiculos.bin", "ab");

    printf("Insira os dados do veiculo:\n");
    fflush(stdin);

    printf("Renavam:");
    gets(veiculo.renavam);

    printf("CPF do proprietario:");
    gets(veiculo.cpfProprietario);

    printf("Marca do veiculo:");
    gets(veiculo.marca);

    printf("Modelo do veiculo:");
    gets(veiculo.modelo);

    printf("Placa do veiculo:");
    gets(veiculo.placa);

    fwrite(&veiculo, sizeof(Veiculo), 1, arquivo);
    fclose(arquivo);

}


void cadastraPessoa(){
    fflush(stdin);
    FILE *arquivo;
    arquivo = fopen("pessoas.bin", "ab");
    Pessoa pessoa;
    printf("Insira os dados da pessoa:\n");
    printf("CPF: ");
    gets(pessoa.cpf);
    printf("Nome: ");
    gets(pessoa.nome);
    printf("Email:");
    gets(pessoa.email);

    fwrite(&pessoa, sizeof(Pessoa), 1, arquivo);
    fclose(arquivo);
}

void listaVeiculos(){
    FILE *arquivo;
    arquivo = fopen("veiculos.bin", "rb");
    Veiculo veiculo;
    if(arquivo!=NULL) {
        printf(" RENAVAM   | CPF do proprietario |        Marca       |       Modelo       | Placa\n");
        while(!feof(arquivo) && fread(&veiculo, sizeof(Veiculo), 1, arquivo) == 1 ){
                printf("%-11s|%-21s|%-20s|%-20s|%s\n", veiculo.renavam, veiculo.cpfProprietario, veiculo.marca, veiculo.modelo, veiculo.placa);
        }
        fclose(arquivo);
    }
    else {
        printf("Nenhum registro encontrado.\n");
    }
}


void listaPessoas(){
    Pessoa pessoa;
    FILE *arquivo;
    arquivo = fopen("pessoas.bin", "rb");
    if(arquivo != NULL) {
        printf("|      CPF      |             Nome             |     Email   \n");
        while(!feof(arquivo) && fread(&pessoa, sizeof(Pessoa), 1, arquivo) == 1){
            printf("|%-15s|%-30s|%s \n", pessoa.cpf, pessoa.nome, pessoa.email);
        }
        fclose(arquivo);
    }
    else {
        printf("Nenhum registro encontrado.\n");
    }
}
int main() {
char opcao;
    do {
        printf("Escolha uma opcao: \n1- Cadastrar uma pessoa.\n2- Cadastrar um veiculo.\n3- Listar veiculos.\n4- Listar pessoas.\n5- Sair\n");
        fflush(stdin);
        scanf("%c", &opcao);

        switch(opcao){
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
