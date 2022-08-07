
# Aula 5 - Modelo Relacional de Dados

## Esquema e instância

- Esquema: Descrição da organização dos dados de um BD;
- Instância: Registros guardados nos esquemas.

## Modelo Relacional de Dados

O modelo relacional representa os dados em um BD por meio de um conjunto de relações (tabelas).

- Tupla: cada instância do esquema;
- Esquema: conjunto de atributos que descreve as características dos elementos;
- Relação: tabela completa;
- Atributo: coluna da tabela;
- Domínio: conjunto dos valores possíveis para um atributo;
- Grau da relação: a quantidade de atributos de uma relação.

<center>

![](imgs/15-26-31.png)
</center>

### Características das relações

- Não há tuplas duplicadas em uma relação;
- A ordem das tuplas não é relevante para diferenciá-las;
- Existe ordem dos valores nas tuplas, já que o esquema é definido como um conjunto de atributos;
- Os valores dos atributos devem ser atômicos, não sendo divisíveis em componentes;
- Atributos multivalorados são representados por meio de **outra relação**;
- Atributos **compostos** são representados pelos seus componentes;

## Chave da relação

- Um conjunto de um ou mais atributos que identifique unicamente cada tupla é chamado de **chave da relação**. A definição dessa chave é identificada como chave primária ou chave primária composta da relação, a depender da quantidade de atributos que a constituem.

## Restrições de Integridade

| Tipo de restrição | Descrição |
| - | - |
| Chaves | Cada atributo das chaves candidatas deve possuir valor único em todas as tuplas da relação.
| Entidade | Uma chave primária não pode assumir valor nulo nas tuplas da relação
| Referencial | Inclusão de atributo(s) de uma relação que referencia outra tupla em outra relação, surgindo um novo tipo de chave.
| Semântica | Valores ou características que determinados atributos podem assumir no contexto de uma determinada aplicação.

## Restrição de Participação

Determina que a existência de uma entidade depende de sua participação em um tipo de relacionamento. Existem dois tipos de restrição de participação: total e parcial. A participação total está estreitamente relacionada à dependência de existência.

- Participação total: Suponha que um empregado deve trabalhar em um departamento, ou seja, não existem empregados que não estejam vinculados a algum departamento. Assim, uma entidade do tipo EMPREGADO existe somente se ela participa em uma instância de relacionamento trabalha.

<center>

![](imgs/15-35-15.png)
</center>

- Participação parcial: o tipo de relacionamento gerencia, o qual envolve os tipos de entidade EMPREGADO e DEPARTAMENTO, a participação do tipo de entidade EMPREGADO é parcial, pois somente alguns empregados gerenciam departamentos, o que não limita a existência dos demais empregados.

<center>

![](imgs/15-35-44.png)
</center>

## Mapeamento do ME-R para Modelo Relacional

O Modelo de Entidade-Relacionamento faz uma representação conceitual dos dados de uma aplicação, enquanto o Modelo Relacional fornece uma representação dos dados de forma mais próxima de como estes dados se encontrarão quando forem definidos os arquivos para o BD.

### Passos para o mapeamento ME-R $\rightarrow$ MR

1. Todas as entidades são mapeadas para uma relação contendo os mesmos atributos do ME-R;
2. As relações para entidades fracas possuem, além de todos os atributos da entidade, como chave estrangeira a chave primária da entidade forte;
3. Em relacionamentos 1:1, dentre as relações que mapeiam as entidades, escolhe-se uma delas (a que possuir participação total) e inclui-se como chave estrangeira a chave primária da outra;
4. Em relacionamentos 1:N, a chave primária da entidade do lado 1 torna-se chave estrangeira na relação que representa a entidade do lado N. Não se aplica a relacionamentos de identificação - fracos;
5. Em relacionamentos N:M cria-se uma nova relação contendo como chaves estrangeiras as chaves primárias das entidades participantes e os atributos do relacionamento;
6. Para atributos multivalorados (A) cria-se uma relação R que terá como atributos os atributos de A e a chave primária da entidade (ou relacionamento) no qual A é atributo;
7. Para relacionamentos triplos (ou ternários) o mapeamento ocorre de forma semelhante ao descrito pela regra 5, apenas considerando que se uma das entidades apresentar um limite máximo de participação igual a 1, a chave desta entidade pode determinar a relação montada.

## Descrição de Esquemas

Uma restrição que relaciona entidades implanta a chave primária. Tal chave permite o relacionamento com outras relações de forma consistente, por meio de uma chave estrangeira (ou secundária).

A chave estrangeira também deve ser identificada de forma clada na descrição do esquema, de acordo com a sintaxe:

`restrição <identificador> de chave estrangeira(<atributo(s) da relação>) que referencia <outra relação>(<atributo>)`

- As siglas PK e FK são utilizadas nos identificadores de restrições de chave primária e estrangeira.

Exemplo:

```sql
    restrição CIDADE_PK de chave primária(nome, estado)
    restriução PAIS_ESTADO_FK de chave estrangeira(sigla, pais) que referencia ESTADO(sigla, pais)

```

## Operações sobre as Relações

Podem ser definidas operações de inserção, remoção e atualização das tuplas de uma determinada relação, todas elas respeitando as restrições de integridade.

## Álgebra Relacional

Consiste em operadores que realizam ações sobre as relações. Podem ser classificados em duas categorias:

- Operadores de Conjuntos: operadores típicos da álgebra, como união, interseção, diferença e produto cartesiano;
- Operadores Relacionais: operadores especiais definidos especialmente para manipulação de tuplas, como seleção, junção e projeção.
