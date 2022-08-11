---
title: ""
geometry: left=2cm,right=2cm,top=1cm,bottom=2cm
output: pdf_document
---
Estudante: Nicolas Chagas Souza

Matrícula: 200042327

## Resolução

Utilizando as relações fornecidas, obteve-se as seguintes expressões e relações para as operações:

a) União de B com Y: B $\cup$ Y

| |Código|Nome|
|-|-|-|
|1|001|Brasil|
|2|104|C.E.F.|
|3|341|Itaú|
|4|350|Real|

b) Interseção de B com Y: B $\cap$ Y

| |Código|Nome|
|-|-|-|
|1|001|Brasil|

c) Diferença de B com Y (B-Y) e de Y com B (Y-B):

B - Y

| |Código|Nome|
|-|-|-|
|1|104|C.E.F.|
|2|341|Itaú|

Y - B

| |Código|Nome|
|-|-|-|
|1|350|Real|

d) Produto cartesiano de B com Y: B $\times$ Y

| |Código|Nome|Código|Nome
|-|-|-|-|-|
|1|001|Brasil|001|Brasil|
|2|001|Brasil|350|Real|
|3|104|C.E.F.|001|Brasil|
|4|104|C.E.F.|350|Real|
|5|341|Itaú|001|Brasil|
|6|341|Itaú|350|Real|

e) Projeção de idAgencia, cidade e estado sobre a agência:

$\pi$ Id_Agência, cidade, estado (A)

||Id_Agência|Cidade|Estado|
|-|-|-|-|
|1|5101|Brasília|DF|
|2|930|Brasília|DF|
|3|4146|Taguatinga|DF

f) Seleção dos clientes de Brasília:

$\sigma$[Cidade="Brasilia"] (L)

||CPF|Nome|Fone_resi.|Cidade|Estado|
|-|-|-|-|-|-|
|1|100|João Castro |4563760 |Brasília |DF |
|2|200|José Sechi  |3576721 |Brasília |DF |

g) Junção da conta com a agência;

$\theta$ [Agência=Id_Agência] (C, A)

||Conta|Tipo_Conta|Saldo|Agência|Rua|Número|Compl.|Bairro|Cidade|Estado|Banco|
|-|-|-|-|-|-|-|-|-|-|-|-|
|1|59431|Poupança|1000,00|4146|Q.S.|07|Lote 1|Águas Claras|Taguatinga|DF|341
|2|47856|Corrente|-50,00|930|L 2| 407|Bloco A|A. Sul|Brasília|DF|001|
|3|30124|Corrente|200,00|4146|Q.S.|07|Lote 1|Águas Claras|Taguatinga|DF|341

h) Projeção da agência, tipo conta e cidade da seleção de contas com saldo NÃO negativo;

$\pi$ Agência, Tipo_Conta, Cidade ($\theta$ [Id_Agência=Agência] (A, ($\sigma$ [saldo>0] (C)))

||Agência|Tipo_Conta|Cidade|
|-|-|-|-|
|1|4146|Poupança|Taguatinga|
|2|4146|Corrente|Taguatinga|

i) Projeção do nome, saldo, estado da seleção do estado diferente de “DF” sobre a junção do cliente com a conta;

$\pi$ Nome, Saldo, Estado ( ($\theta$ [N_Conta, Conta] ( $\theta$ [CPF, N_CPF] ($\sigma$ [estado $\neq$ "DF"] (L), CC), C)))

||Nome|Saldo|Estado|
|-|-|-|-|
|1| Maria Alves | -50,00| GO

j) Projeção de nome, telefone da residência, conta e saldo dos clientes com saldo negativo e que sejam do "DF".

$\pi$ Nome, Fone_resid., Conta, Saldo ($\sigma$ [saldo<0 $\wedge$ estado = "DF"] ($\theta$ [N_Conta, Conta] ( $\theta$ [CPF, N_CPF] (L, CC), C)))

||Nome|Fone_resid.|Conta|Saldo|
|-|-|-|-|-|
|1|José Sechi|3576721|47856|-50,00|
