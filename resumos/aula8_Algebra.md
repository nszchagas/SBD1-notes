# Álgebra Relacional

## Operadores de conjuntos

Os seguintes operadores aplicam-se a duas relações que obedeçam à **compatibilidade de união**, ou seja, ambas apresentam como esquema atributos que pertençam respectivamente aos mesmos domínios.

1. União $\cup$: o resultado da união de duas relações consiste no conjunto de todas as tuplas que pertençam a ambas relações;

2. Interseção $\cap$: o resultado da interseção de duas relações consiste no conjunto de todas as tuplas que aparecem ao mesmo tempo nas duas relações.

3. Diferença $-$: a diferença entre duas relações R e S consiste no conjunto de tuplas que aparecem na relação R, mas não na relação S.

4. Produto Cartesiano $\times$: aplica-se a duas relações que **não** precisam ser "compatíveis de união", resultando em uma relação que apresenta tuplas formadas pela combinação dos atributos pertencentes a ambas relações.

Exercício de Fixação

1. Sejam as seguintes relações existentes em um banco de dados:

### FORNECEDOR (F)

|#|codigo|nome|idPeca|valor|
|-|-|-|-|-|
|1|23|Altar         |10|35,00|
|2|35|Mecânica Jair |22|50,00|
|3|44|Eletrons      |07|99,00|
|4|57|Thorque       |22|47,00|
|5|89|Rápido        |10|35,00|

### PECAS (P)

|#|idPeca|dsPeca|cor|peso|
|-|-|-|-|-|
|1|07|Mola estreita |Prata|10 gr.  |
|2|10|Correia lisa  |Preto|0,5 gr. |
|3|22|Amortecedor   |Preto|2000 gr |
|4|35|Tambor        |Azul|500 gr  |

### NOVOS_FORNECIMENTOS(G)

|#|codigo|nome|idPeca|valor|
|-|-|-|-|-|
|1|57|Thorque       |35|45,00|
|2|90|Solução Final |10|50,00|

Construa as relações resultantes das operações algébricas abaixo, além da expressão algébrica correta:

a) União de F com G: F $\cap$ G

|#|codigo|nome|idPeca|valor|
|-|-|-|-|-|
|1|23|Altar         |10|35,00|
|2|35|Mecânica Jair |22|50,00|
|3|44|Eletrons      |07|99,00|
|4|57|Thorque       |22|47,00|
|5|89|Rápido        |10|35,00|
|6|57|Thorque       |35|45,00|
|7|90|Solução Final |10|50,00|

b) Interseção de F com G para o mesmo fornecedor: F $\cap$ G
|#|codigo|nome|idPeca|valor|
|-|-|-|-|-|
|1|57|Thorque       |35|45,00|
|2|57|Thorque       |22|47,00|

c) Diferença em relação ao fornecedor (de F com G e também de G com F):

F $-$ G
|#|codigo|nome|idPeca|valor|
|-|-|-|-|-|
|1|23|Altar         |10|35,00|
|2|35|Mecânica Jair |22|50,00|
|3|44|Eletrons      |07|99,00|
|4|57|Thorque       |22|47,00|
|5|89|Rápido        |10|35,00|
|6|57|Thorque       |35|45,00|
|7|90|Solução Final |10|50,00|

d) Produto cartesiano de P com G: P $\times$ G

|#|codigo|nome|idPeca|valor|idPeca|dsPeca|cor|peso|
|-|-|-|-|-|-|-|-|-|
|1|57|Thorque       |35|45,00|07|Mola estreita |Prata|10 gr.  |
|2|90|Solução Final |10|50,00|07|Mola estreita |Prata|10 gr.  |
|1|57|Thorque       |35|45,00|10|Correia lisa  |Preto|0,5 gr. |
|2|90|Solução Final |10|50,00|10|Correia lisa  |Preto|0,5 gr. |
|1|57|Thorque       |35|45,00|22|Amortecedor   |Preto|2000 gr |
|2|90|Solução Final |10|50,00|22|Amortecedor   |Preto|2000 gr |
|1|57|Thorque       |35|45,00|35|Tambor        |Azul|500 gr  |
|2|90|Solução Final |10|50,00|35|Tambor        |Azul|500 gr  |

## Operadores Relacionais

### Operação de seleção (SELECT)

Quando aplicado resulta em uma relação contendo tuplas com os mesmos atributos da relação que satisfazem a uma determinada condição de seleção. É um operador unário, sendo executado sobre apenas uma relação, uma tupla de cada vez.
<center>

$\sigma$[\<condição de seleção\>](\<nome da relação\>)
</center>

Em geral, pode-se usar os operadores relacionais ($\neq, =, <, \leq, >, \geq$) na operação de seleção, além da condição ser composta por mais que um predicado condicional, interligados pelos conectivos E ($\wedge$) e OU ($\vee$) lógicos.

#### Operação de Projeção (PROJECT)

Seleciona atributos de uma relação de acordo com a lista de atributos disponíveis. Os atributos são exibidos na mesma ordem que aparecem na lista. Seu resultado é uma relação que não contém repetições nas tuplas produzidas.

<center>

$\pi$\<lista  de atributos \> (\<nome da relação\>)
</center>

#### Operação de Junção (JOIN)

É utilizada para combinar tuplas relacionadas de duas relações (operação binária) em uma tupla simples. Esta combinação é realizada de acordo com uma condição indicada.
<center>

$\theta$ [\<condição\>] (\<nome das relações\>)
</center>

> Uma operação relacional sempre resulta em outra relação que pode ser usada na elaboração de consultas mais complexas.
>

### Exemplos

#### FORNECEDOR (F)

|#|codigo|nome|idPeca|valor|
|-|-|-|-|-|
|1|23|Altar         |10|35,00|
|2|35|Mecânica Jair |22|50,00|
|3|44|Eletrons      |07|99,00|
|4|57|Thorque       |22|47,00|
|5|89|Rápido        |10|35,00|
|6|44|Eletrons      |35|52,00|
|7|57|Thorque       |35|64,00|

Exemplos

a) $\sigma$ [codigo=4] (FORNECEDOR)

|#|codigo|nome|idPeca|valor
|-|-|-|-|-|
|1|44|Eletrons      |07|99,00|
|2|44|Eletrons      |35|52,00|

b) $\sigma$ [codigo=70] (FORNECEDOR)
|#|codigo|nome|idPeca|valor
|-|-|-|-|-|

c) $\sigma$ [codigo=35] (FORNECEDOR)

|#|codigo|nome|idPeca|valor
|-|-|-|-|-|
|1|35|Mecânica Jair |22|50,00|

d) $\pi$ nome, idPeca (FORNECEDOR)
|#|nome|idPeca
|-|-|-|
|1|Altar         |10|
|2|Mecânica Jair |22|
|3|Eletrons      |07|
|4|Thorque       |22|
|5|Rápido        |10|
|6|Eletrons      |35|

d) $\pi$ codigo, valor ($\sigma$ [nome="Thorque"] (FORNECEDOR))

|#|codigo|valor|
|-|-|-|
|1|57|47,00|
|2|57|64,00|

### PECAS

|#|idPeca|dsPeca|cor|peso|
|-|-|-|-|-|
|1|07|Mola estreita|Prata|10 gr.|
|2|10|Correia Lisa|Preto|0,5 gr.|
|3|22|Amortecedor|Preto|2000 gr.|
|4|35|Tambor|Azul|500 gr.|

### NOVOS_FORNECIMENTOS

|#|codigo|nome|idPeca|valor
|-|-|-|-|-|
|1|57|Thorque|35|45,00|
|2|90|Solução Final|10|50,00|

e) $\theta$[idPeca=idPeca] (PECAS, NOVOS_FORNECIMENTOS)

|#|idPeca|dsPeca|cor|peso|codigo|nome|valor
|-|-|-|-|-|-|-|-|
|1|10|Correia Lisa|Preto|0,5 gr.|90|Solução Final|50,00
|2|35|Tambor|Azul|500 gr.|57|Thorque|45,00

## Funções Agregadas

Consistem em funções que podem ser aplicadas a valores numéricos, dentre elas estão:

- Average (média aritmética);
- Count (contador);
- Sum (soma);
- Maximum (maior);
- Minimum (mínimo);
