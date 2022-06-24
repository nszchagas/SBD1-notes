# Aula 1 - Introdução

## Banco de Dados

- A definição de _Banco de Dados_ está relacionada à coleção ou conjunto de dados armazenados que são usados por algumas situações específicas;
- Um arranjo aleatório de dados não pode ser considerado um banco de dados.

## Histórico Evolutivo de Banco de Dados

- Até 1960 utilizava-se o sistema de arquivos (Pascal, C, etc.);
- No final dos anos 60 surgiu o modelo de banco de dados _Hierárquico_, que conecta os dados com ligações. A estrutura é organizada um modelo de árvore (modelo hierárquico);
- Nos anos 70 e início dos anos 80 utilizava-se o modelo de _Redes_, no qual quaisquer dois tipos de registros podem se relacionar.
- Em meados dos anos 80 surgiu o modelo _Relacional_, que armazena dados em tabelas;
- No final dos anos 80 surgiram os modelos Orientado a Objetos e Objeto-Relacional

## Introdução

- Um sistema de BD oferece uma visão "abstrata" dos dados aos usuários.
- A disponibilidade eficiente desses dados é fundamental.
- O conceito da abstração está associado à característica de se observar somente os aspectos de interesse.

## Dados e Informações

| Dado                                                                   | Informação                                                      |
| ---------------------------------------------------------------------- | --------------------------------------------------------------- |
| Denota um fato que pode ser registrado e possui significado implícito. | Denota uma organização em relação a um conteúdo ou uma novidade |

## Propriedades dos Banco de Dados

- Um banco de dados é uma coleção logicamente coerente de dados.
- Um banco de dados é projetado e construído com dados para um propósito específico.
- Ele possui um grupo de usuários e algumas aplicações pré-concebidas, as quais esses usuários estão interessados.
- Um bando de dados representa algum aspecto do mundo real, e a alteração nesse mundo tem que ser refletida no banco de dados.
- Um banco de dados tem:
  - Fonte de onde os dados são derivados
  - "Taxa" de interação
  - "Audiência" interessada
  - Qualquer quantidade de dados
  - Variação de complexidade
  - Criação e manutenção manualmente ou por equipamentos

## Arquitetura de Banco de Dados

| Nível Externo                                             | Nível Lógico                                                                                               | Nível Interno                                                                                            |
| --------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------- |
| Descreve parte do BD por meio de estruturas mais simples. | Descreve quais dados estão armazenados de fato e as relações entre eles. Estruturas relativamente simples. | Descreve como os dados realmente estão armazenados, onde complexas estruturas são descritas em detalhes. |

## Perfis em Banco de Dados

- Em um grande banco de dados com muitos usuários e com restrições de acesso podem-se identificar alguns perfis de pessoas que interagem com o BD:
  - Administrador do Banco de Dados (DBA): Supervisor do banco de dados, responsável pela autorização de acesso, monitoramento e coordenação de seu uso. Está envolvido com os aspectos físicos do banco de dados (estruturas de armazenamento, métodos de acesso, etc);
  - Projetista do Banco de Dados: Responsável pela identificação dos dados e a elaboração de estruturas apropriadas para armazená-los. Deve compreender os requisitos necessários aos grupos de usuários do banco de dados antes de sua implementação ou em sua manutenção.
  - Analista de Sistemas: Determina os requisitos dos usuários e desenvolve especificações que atendam estes requisitos.
  - Programador de Aplicações: Implementa as especificações na forma de programas (aplicações), elaborando a documentação necessária da implementação.
  - Usuário (final): Normalmente realiza consultas e atualizações no banco de dados.

## Banco de Dados e Arquivos

| Banco de Dados                                                                                                                                                                             | Sistema de Arquivos                                                                                                                                                                                           |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Um único repositório de dados é mantido. Acesso de todos usuários sobre o mesmo BD com um único espaço de armazenamento e atualização dos dados em apenas uma estrutura do banco de dados. | Implementa os arquivos necessários para uma aplicação específica. Há redundância de arquivos armazenando os mesmos dados com perda de espaço de armazenamento e esforço adicional para atualização dos dados. |

## Sistema Gerenciador de BD (SGBD)

É uma coleção de programas que habilitam usuários a criar e manter um banco de dados. É um software de propósito geral que facilita as operações em um banco de dados.

Características de um "bom" SGBD

- Controle sobre a redundância
- Compartilhamento de Dados
- Restrição de acesso não autorizado
- Fornecimento de múltiplas interfaces
- Força restrições de integridade
- Sistema de Backup e Recovery

## Terminologia Inicial de BD

- Campo: unidade básica de informação mínima com significado
- Registro: conjunto de campos
- Arquivo: conjunto de registros
- Banco de Dados: conjunto de arquivos e suas formas de manipulação

## Linguagens em Banco de Dados

Um sistema de banco de dados proporciona dois tipos de linguagens: uma específica para as estruturas do BD e outra para expressar consultas e atualizações nas estruturas.

- Linguagem de Definição de Dados (DDL) - uma estrutura de dados é representada por um conjunto de definições expressas por uma linguagem.
  - O resultado no uso da DDL constitui em um arquivo especial chamado de dicionário ou diretório de dados;
  - Um dicionário de dados é um arquivo de metadados.

**_METADADOS_** são informações a respeito dos dados. Em um sistema de BD eles são consultados antes que o dado "real" que esteja armazenado seja manipulado. Fornecem mais informações sobre os dados, tornando mais fácil sua organização e o armazenamento eficiente.

- Linguagem de Manipulação dos Dados (DML) - é a linguagem que viabiliza o acesso ou a manipulação (recuperação, inserção, remoção e modificação) dos dados de forma compatível ao modelo de dados apropriado.

  - Linguagem de Consulta dos Dados - é parte de uma DML responsável pela recuperação de dados (Structured Query Language - SQL)

**_OBSERVAÇÃO:_** apesar de ser tratada como uma linguagem de consulta, a SQL apresenta mais recursos como meios de definição de estruturas de dados, recursos de modificação de dados no BD e especificação de restrições de segurança.

## Modelo de Dados

Conjunto de conceitos utilizados para descrever a estrutura de um banco de dados: os tipos de dados, relacionamentos e restrições sobre eles. É a principal ferramenta no fornecimento de informações sobre a abstração realizada na parte de interesse específico no mundo real.

- Modelo de dados Conceitual ou de alto nível: fornece conceitos que são próximos da percepção lógica dos usuários a respeito dos dados
- Modelo de dados de Implementação: utilizado em SGBDs comerciais, sendo o mais popular denominado Modelo Relacional (MR)
- Modelo de dados Físico ou de baixo nível: descreve como os dados são armazenados fisicamente.
