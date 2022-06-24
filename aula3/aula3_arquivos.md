# Aula 4 - Modelo de Entidade Relacionamento

## Modelo Entidade-Relacionamento (ME-R)

É baseado na percepção do mundo real, que consiste em um conjunto de objetos básicos chamados de entidades e nos relacionamentos entre esses objetos.

Foi desenvolvido para facilitar o projeto de BD, permitindo a especificação de um esquema de negócio, que representa a estrutura lógica geral do BD.

## Entidade

Conceito fundamental da abordagem entidade-relacionamento (E-R).

- Conjunto de objetos da realidade modelada sobre os quais deseja-se colecionar dados no banco de dados.
- Pode ser concreta (pessoa) ou abstrata (curso).
- Uma entidade representa um conjunto de objetos dos quais que se deseja guardar dados e é importante para o seu mundo real.

Exemplo: Em um sistema bancário as entidades podem ser: clientes, contas correntes, cheques, agências, dentre outros. Sendo que cliente representa o conjunto de clientes dos quais se deseja manter dados no banco de dados.

## Relacionamento

O conjunto de associações entre as Entidades.

- É a coleção de ocorrências das entidades relacionadas (associadas).
- A função qwe uma entidade exerce em um relacionamento é chamada de papel.
- Também pode ter atributos descritivos (por exemplo: data, hora, etc.) onde ocorre tal relacionamento.
- A ocorrência de um relacionamento particular dentro de um conjunto de relacionamentos de um mesmo tipo é chamada de instância do relacionamento.

Exemplo:
Suponha o relacionamento lotação entre as entidades DEPARTAMENTO e PESSOA.

| entidade PESSOA | relacionamento lotação | entidade DEPARTAMENTO |

## Diagrama de Ocorrência

A elaboração deste diagrama é útil

<!-- @TODO: continuar -->

## Atributo

O dado que é associado a cada ocorrência de uma entidade ou um relacionamento.

- Uma Entidade é representada por um único ou vários atributos.
- Para cada atributo existe um conjunto de valores permitidos, chamado domínio daquele atributo.
- O atributo mapeia uma entidade em um domínio.

Exemplo: Cliente - cada ocorrência de cliente terá associado exatamente os seus atributos (nome, CPF, telefone, endereço)

## Dependência de Existência

- Considere os conjuntos de entidade CONTA e TRANSAÇÃO, com o relacionamento lançamento entre estes conjuntos.
- Caso um registro da entidade CONTA seja apagada, todas as suas transações também deverão ser.
- Porém se uma TRANSAÇÃO for apagada, nada acontecerá com o registro da entidade CONTA especificada.
- A entidade CONTA é dominante e a TRANSAÇÃO é subordinada (ou dependente de CONTA).

## Chave

É um ou mais atributos que permitem identificar unicamente uma entidade no conjunto de registros da entidade.

- Chave candidata é o atributo, ou a composição de atributos, que pode identificar unicamente uma entidade.
- Chave primária define a chave candidata escolhida pelo projetista de dados para identificar os registros de uma entidade.

## Diagrama Entidade-Relacionamento

A estrutura lógica geral de um BD pode ser representada graficamente por um Diagrama de Entidade-Relacionamento (DE-R), que é composto por:

- Entidades: representadas por retângulos
- Entidades fracas: representadas por retângulos com bordas duplas
- Relacionamentos: representados por losangos
- Relacionamentos de identificação: representados por losangos com borda dupla
- Ligações entre entidades e seus atributos e entidades aos seus relacionamentos: representadas por setas.

### Descrição no DE-R

- Entidade: geralmente _substantivo_ escrito totalmente em _maiúsculo_.
- Relacionamento: _verbo significativo_ ao relacionamento existente entre as entidades participantes.
- Atributo: geralmente substantivo significativo. É escrito em minúsculo.
  **_Observação:_** Não utilizar acentos e evitar underline.

## Cardinalidade

É uma restrição de mapeamento que expressa o número de entidades as quais outra entidade pode ser associada via um conjunto de relacionamento.

A cardinalidade para o relacionamento entre as entidades A e B pode ser:

- Um para um (1:1): uma entidade de A está associada a uma única entidade de B, e uma entidade de B está associada a uma única entidade de A.
- Um para muitos (1:n): uma entidade de A está associada a qualquer quantidade da entidade B, e uma entidade de B está associada a uma única entidade de A.
- Muitos para um (n:1): uma entidade de A está associada a uma única entidade de B, e uma entidade de B pode estar associada a qualquer quantidade de entidades de A.
- Muitos para muitos (n:m): uma entidade de A está associada a qualquer quantidade da entidade B, e uma entidade de B pode estar associada a qualquer quantidade de entidades de A.

<!-- @TODO: inserir imagens dos slides 7, 13, 15, 19, 20,-->

### Exercício slide 21:

Descrever as entidades: quais são os atributos necessários?
Vida acadêmica: notas,
