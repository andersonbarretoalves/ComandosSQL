# Comandos SQL

### SELECT
* O SELECT é um exemplo perfeito de DQL, ou comando para consulta de dados. Ele deve ser acompanhado de uma
indicação específica do local onde o dado será consultado (o FROM). 
* * O SELECT é um dos comandos SQL mais importantes e mais versáteis quando se trabalha com SQL. Pode ser
usado em casos de leituras simples, como também se adapta a processos mais complexos. Tudo depende da demanda.
* * `SELECT * FROM Vendas;`
* * `SELECT Aluno, Curso, Valor FROM Vendas;`
* * Então com esse código você vai poder selecionar as colunas específicas ou todas (com o *) de uma tabela.

### ORDER BY
* Mais um DML (manipulação). A função do ORDER BY é simplesmente ordenar os dados de acordo com alguma
lógica, algum critério específico. Vai te ajudar a ordenar as informações dentro de uma coluna para que
fique mais fácil a visualização.
* * `SELECT * FROM tabela ORDER BY Name asc` - Ordem crescente
* * `SELECT * FROM tabela ORDER BY Name desc` - Ordem decrescente
* * `SELECT * FROM tabela ORDER BY FirstName desc, LastName asc`
* * É usado dentro de um comando SELECT, especificando qual vai ser o elemento de referência para a ordenação.

### WHERE
* A cláusula WHERE é usada em casos de consulta para ajudar a especificar os dados que serão consultados
e manipulados.
* Ele serve para filtrar dados em uma tabela.
* Com o filtro você facilita a visualização dos dados, mostrando apenas as informações que precisa ver.
* * `SELECT * FROM Vendas WHERE Estado = 'RJ';`
* * É importante usar esse elemento para definir exatamente qual dado será usado para alteração, bem
como a linha.
* * Quando ocorre a situação em que as pessoas esquecem o WHERE, há um risco grande de fazer uma
alteração global, ou seja, em todas as linhas da tabela, o que gera uma grande confusão.

### DISTINCT
* é utilizado para retornar apenas uma ocorrência de campos que contenham dados repetidos.
Esse recurso é útil para eliminar a duplicidade de informações e, assim, recuperar apenas o 
que será utilizado pela aplicação.
* * `SELECT DISTINCT FirstName FROM Aluno;`

### UPDATE
* Um clássico exemplo de DML. O UPDATE serve para atualizar dados nas tabelas.<BR>
  É preciso usar o WHERE para especificar qual é o dado, pois, caso contrário, a pessoa vai aplicar a atualização
em todas as linhas da tabela.
* * `UPDATE Vendas SET Valor = 150 WHERE Curso = 'VBA'`
* * É usado quando é preciso inserir um novo dado ou alterar algo que já estava registrado.
Por exemplo, se uma pessoa indica uma informação no formulário e depois solicita mudança. 
Então, o programador do banco de dados vai naquela linha e naquela coluna e realiza a alteração. 

### DELETE FROM
* O DELETE também é um DML que precisa de muito cuidado para ser usado. Ele exclui dados de acordo 
com um critério definido ou então um dado em específico.
* * `DELETE FROM Vendas WHERE ID_Venda = 10;`
* * Apaga as informações apenas, ao passo que a estrutura e o objeto em si continuam existentes.

### TRUNCATE TABLE
* O TRUNCATE TABLE que serve para excluir todos os dados da tabela.
* É um comando mais direto e simples que apaga as informações de uma tabela e a redefine para um 
estado inicial, vazio, sem informações.
* * `TRUNCATE TABLE Vendas;`
* * É uma forma mais simples de apagar informações sem um critério específico informando filtros.
* * Evidentemente, deve ser usado em casos muito específicos, quando realmente se tem certeza da 
Pnecessidade de exclusão da tabela.

### COUNT
* retorna o total de linhas selecionadas. Ela pode receber por parâmetro o nome da coluna ou um
asterisco. Por padrão, quando informado o nome de uma coluna, valores do tipo null são ignorados,
mas quando informado * todas as linhas serão contabilizadas.
* * `SELECT COUNT(*) FROM tabela`
*  * `SELECT COUNT(Title) FROM tabela`

### TOP
* É utilizado para especificar o número de registros a retornar. Útil para tabelas com muitos registros.
* * `SELECT TOP 10 * FROM tabela`

### BETWEEN
*  é utilizado para selecionarmos um determinado range de registros em uma tabela, ou seja, definimos um ponto inicial e final para que o SQL recupere todos os dados pertencentes a ele.
* * `SELECT * FROM Product WHERE ListPrice BETWEEN 1000 AND 1500;` - Ordena os produtos entre 1000 à 1500.
* * `SELECT * FROM Product WHERE ListPrice NOT BETWEEN 1000 AND 1500;` - Não ordena os produtos de 1000 à 1500.
* * `SELECT * FROM Employee WHERE HireDate BETWEEN '2009/01/01' AND '2010/01/01' ORDER BY HireDate;`

### IN
* é um operador para especificar vários valores em uma cláusula WHERE. Com ele podemos verificar se determinada coluna está sendo mencionada em um determinado grupo de valores, seja ele definido manualmente ou através de subquerys.
* * `SELECT * FROM Product WHERE Color IN ('BLUE', 'RED')`
* * `SELECT * FROM Product WHERE ProductID IN (2,7,13)`

### LIKE
*  É utilizado para buscar por uma determinada string dentro de um campo com valores textuais. Com ele podemos, por exemplo, buscar os registros cujo NOME inicia com uma determinada palavra, ou contém um certo texto.
* * `SELECT * FROM tabela WHERE FirstName LIKE 'ovi%'` - será complemetado as letras após "%".
* * `SELECT * FROM Person.Person WHERE FirstName LIKE '%so_'` - será completado as letras antes do "%" e uma letra no lugar do "_".
* OBS: O Comando LIKE não é "case sensitive".

### 