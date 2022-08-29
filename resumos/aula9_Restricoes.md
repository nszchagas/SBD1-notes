# Aula 9 - Restrições

## Instrução ALTER TABLE

Essa instrução permite:

- Adicionar um atributo;
- Modificar um atributo existente;
- Eliminar um atributo da relação.

Sintaxe: `ALTER TABLE <table> [tarefa] (informações da tabela);`

Exemplos:
|SQL | Descrição |
| - | - |
|ALTER TABLE ESTADOS <br/> ADD (cidade varchar(10));| Inclui novo atributo na tabela|
|ALTER TABLE ESTADOS <br/> MODIFY (cidade varchar(30));| Altera atributo|
|ALTER TABLE ESTADOS <br/> DROP COLUMN cidade; | Apaga atributo.|

> Eliminação de um atributo por vez, e a relação se mantém sempre com um atributo.

## Restrições de integridade

As instruções de integridade são criadas junto com a tabela ou podem ser incluídas pela instrução ALTER TABLE.

|Restrição|SQL|
|-|-|
| Obrigatório | NOT NULL|
| Chave primária | CONSTRAINT \<nome\> PRIMARY KEY(\<nome da coluna\>);
| Chave estrangeira | CONSTRAINT \<nome\> FOREIGN KEY(\<nome da coluna\>) <br/>REFERENCES \<tabela\> (\<nome da coluna\>);
