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

### AS
* É usado para colar um apelino na coluna.
* * `SELECT TOP 10 SUM(linetotal) AS "SOMA"FROM tabela` - Soma será o nome da coluna com o resultado.

### SUN
*  Recebe como parâmetro uma coluna ou uma expressão e retorna um resultado. Ao passar uma coluna, SUM somará todos os resultados da tabela que forem retornados para a coluna especificada. Já ao receber uma expressão, SUM resolverá a expressão para cada valor antes de somá-los.
* * `SELECT TOP 10 SUM(linetotal) AS "SOMA"FROM tabela` - será somado o total da Coluna "linetotal".

### MIN
* Retorna o menor valor
* * `SELECT TOP 10 MIN(linetotal) AS "MenorValor"FROM tabela`

### MAX
* Retorna o maior valor
* * `SELECT TOP 10 MAX(linetotal) AS "MaiorValor"FROM tabela`

### AVG
* Retorna a média
* * `SELECT TOP 10 AVG(linetotal) AS "Media"FROM tabela`

### GROUP BY
* Divide o resultado da sua pesquisa em grupos
* * `SELECT coluna1, funcaoAgregacao(coluna2) FROM nomeTabela GROUP BY coluna1;`
* * `SELECT SpecialOfferID, SUM(UnitPrice) AS "Soma" FROM Sales.SalesOrderDetail GROUP BY SpecialOfferID`

### YAER
* YEAR retorna o mesmo valor que DATEPART (year, date). Se date contiver apenas uma parte de hora, o valor retornado será 1900, o ano base.
* * `SELECT YEAR(Data) AS Ano, COUNT(*) AS DiasÚteis FROM DiasUteis WHERE ÉDiaÚtil = 1 GROUP BY YEAR(Data) ORDER BY Ano;`

### HAVING
* É basicamente usado em conjunto com o GROUP BY para filtrar resultados de um agrupamento.
* De uma forma mais simples como um WHERE para dados agrupados.
* * `SELECT coluna1, funcaoAgregacao(coluna2) FROM nomeTabela GROUP BY coluna1 HAVING condicao;`
* * `SELECT FirstName, COUNT(FirstName) AS "Quantidade" FROM Person.Person GROUP BY FirstName HAVING COUNT(FirstName) > 10;`

### INNER JOIN
* compara cada linha da tabela A com as linhas da tabela B para encontrar todos os pares de linhas que satisfazem a condição de junção. Retorna apenas os resultados que correspondem (existem) tanto na tabelaA como tabelaB.
* * `SELECT BusinessEntityID, Name, pnt.PhoneNumberTypeID, PhoneNumber FROM Person.PhoneNumberType PNT INNER JOIN Person.PersonPhone PP ON Pnt.PhoneNumberTypeID = pp.PhoneNumberTypeID`
* * `SELECT TOP 10 AddressID, City, PA.StateProvinceID, Name FROM PERSON.StateProvince PS INNER JOIN Person.Address PA ON PS.StateProvinceID = PA.StateProvinceID;`

### FULL OUTER JOIN
* Retorna um Conjunto de todos registros correspondentes da TabelaA e TabelaB
Quado são iguais. E além disso se não houver valores correspondentes, ele simplismente irá preencher esse lado com "null".
* * `SELECT * FROM tabelaA FULL OUTER JOIN tabelaB ON tabelaA.nome = tabelaB.nome`

### LEFT OUTER JOIN/ LEFT JOIN
* Retorna um conjunto de todos os registros da tabelaA, e alem disso, os registros correspondentes(quando disponíveis) na tabelaB. Se não houver registros correspondentes ele simplesmente vai preencher com "null".
* * `SELECT * FROM tabelaA LEFT JOIN tabelaB ON tabelaA.nome = tabelaB.nome`

### SELF JOIN
* Uma cláusula JOIN em SQL, correspondente a uma operação de junção em álgebra relacional, combina colunas de uma ou mais tabelas em um banco de dados relacional. Ela cria um conjunto que pode ser salvo como uma tabela ou usado da forma como está.
* * `SELECT A.ProductID, A.Discount, B.ProductID, B.Discount FROM [Order Details] , [Order Details] BWHERE A.Discount = B.Discount`
* * `SELECT A.ProductID, A.Discount, B.ProductID, B.Discount FROM [Order Details] A JOIN [Order Details] B ON A.Discount = B.Discount`

### UNION
* Combina dois ou mais SELECT em um unico resultado.
* * `SELECT coluna1, coluna2 FROM tabela1 UNION SELECT coluna1, coluna2 FROM tabela2;`

### SUBQUERIES
* é uma consulta embutida dentro de outra consulta, de forma aninhada, passando os resultados da consulta mais interna para a consulta mais externa por meio de uma cláusula WHERE ou de uma cláusula HAVING.
* * `SELECT * FROM Production.Product WHERE ListPrice > (SELECT AVG(ListPrice) FROM Production.Product)`
* * `SELECT FirstName+ ' '+LastName AS Nome FROM Person.Person WHERE BusinessEntityID IN (SELECT BusinessEntityID FROM HumanResources.Employee WHERE JobTitle = 'Design Engineer')`
* * `SELECT p.FirstName+ ' ' +p.LastName AS Nome FROM Person.Person p JOIN HumanResources.Employee e ON p.BusinessEntityID = e.BusinessEntityID AND e.JobTitle = 'Design Engineer'`

### DATEPART
* Esta função retorna um inteiro representando a data especificada da data especificada .
* * `SELECT AVG(ListPrice) AS Média, DATEPART(DAY, ModifiedDate) AS Mês FROM Production.ProductListPriceHistory GROUP BY DATEPART(DAY, ModifiedDate) ORDER BY Mês`
* * https://learn.microsoft.com/en-us/sql/t-sql/functions/datepart-transact-sql?view=sql-server-ver16

###  MANIPULAÇÃO DE STRING
* Segue abaixo um link com a cadeia de caracteres.
* * https://learn.microsoft.com/en-us/sql/t-sql/functions/string-functions-transact-sql?view=sql-server-ver16
* * `SELECT FirstName+ ' ' +LastName AS Nome FROM Person.Person ` - Concatenar
* * `SELECT CONCAT(FirstName,' ', LastName) AS Name FROM Person.Person` - Concatenar
* * `SELECT UPPER(FirstName) FROM Person.Person` - Resultado em letras Maiúsculas
* * `SELECT LOWER(FirstName) FROM Person.Person` - Resultado em letras Minusculas
* * `SELECT  FirstName, LEN(FirstName) AS ContagemCaracteres FROM Person.Person` - Mostra a quantidade de caracteres.
* * `SELECT  FirstName, SUBSTRING(FirstName, 1, 3) FROM Person.Person` - Retorna os caracteres de 1 à 3.
* * `SELECT ProductNumber, REPLACE(ProductNumber, '-', '#') FROM Production.Product` - Vai substituir - por #.

### OPERAÇÕES MATEMÁTICAS
* Segue o link abaixo...
* * https://learn.microsoft.com/pt-br/sql/t-sql/functions/mathematical-functions-transact-sql?view=sql-server-ver16
* * `SELECT UnitPrice + LineTotal AS SOMA FROM Sales.SalesOrderDetail` - Nesse caso foi realizada a soma de 2 tabelas, mas poderia ser subtração...
* * `SELECT LineTotal, ROUND(LineTotal, 2) AS ARREDONDAMENTO FROM Sales.SalesOrderDetail` - Arredondamento com precisão de 2.
* * `SELECT SQRT(LineTotal) FROM Sales.SalesOrderDetail` - Raiz Quadrada

### TIPOS DE DADOS
* **Boleanos**
* * Por padão ele é inicializado como nulo, e pode receber tanto 1 ou 0.
* * **BIT**
* **Caractere**
* * **CHAR** - Permite inserir até uma quantidade fixa de caracters e sempre ocupa todo o espaço reservado 10/50.
* * **VARCHAR** ou **NVARCHAR** - Permite inserir até uma quantidade que for definida,  porem só usa o espaço que for preenchido 10/50.m 
* **Números**
* Valores Exatos:
* * **TINYNT** - Não tem parte valor fracionados (ex: 1.43, 24.23) somente 1, 123123, 324234, 313123 etc...
* * **SMALLINT** - Mesma coisa porem limite maior
* * **INT** - Mesma coisa porem limite maior
* * **BIGINT** - Mesma coisa porem limite maior
* * **NUMERIC** ou **DECIMAL** - Valores exatos, porem permite ter parte fracionados, que também pode ser especificado a precisão e escala (escala é o número de digitos na parte fracional) -ex: NUMERIC (5,2) 113,44
* Valores Aproximados:
* * **REAL** - Tem precisão aproximada de até 15 digitos.
* * **FLOAT** - Mesmo conceito de REAL
* **Temporais**
* * **DATE** - Armazena data no formato aaa/mm/dd
* * **DATETIME** - Armazena data e horas no formato aaaa/mm/dd:hh:mm:ss
* * **DATETIME2** - Data e horas com adição de milissegundos no formato aaaa/mm/dd:hh:mm:mm:sssssss.
* * **SMALLDATETIME** - Data e hora nos respeitando o limite entre '1900-01-01:00:00:00' até '2079-06-06:23:59:59'.
* * **TIME** - Horas, minutos, segundos e milissegundos respeitando o limite de '00:00:00.0000000' to '23:59:59.9999999.
* * **DATETIMEOFFSET** - Permite armazenar informações de data e horas incluindo o fuso horário.

### CHAVE PRIMÁRIA E ESTRANGEIRA
* Uma chave primária é basicamente uma coluna ou grupo de colunas, usada para identeificarunicamente uma linha em uma tabela.
* Você consegue criar essa chave primária através de restrições (ou constraints em inglês), que são regras que vc define quando está criando uma coluna.
* Assim quando você faz isso voce está criando um índice único para aquela coluna ou grupo de colunas.
* * `CREATE TABLE nome_Tabela ( nomeColuna tipoDeDados PRIMARY KEY nomeColuna tipoDedados ...)`
* **Chave Estrangeira** = é uma coluna ou grupo de culunas em uma tabela que identeifica unicamente uma linha em outra tabela.
* ou seja, uma chave estrangeira é definida em uma tabela onde ela é apenas uma referência e não contem todos os dados ali.
* Então uma chave estrangeira é simplismente uma coluna ou grupo de colunas que é uma chave primária em outra tabela.
* A tabela que contem a chave estrangeira é chamada de tabela referênciadora ou tabela filho. É a tabela na qual a chave estrangeira é referenciada é chamada de tabela referenciada ou tabela pai.
* Uma tabela pode ter mais de uma chave estrangeira dependendo do seu relacionamento com as outras tabelas.
* No SQL Server você define uma chave estrangeira atravez de um "Foreign key constraint" ou Restrição de chave estrangeira.
* Uma restrição de chave Estrangeira indica que os valores em uma coluna ou grupo de colunas na tabela filho correspondem aos valores na tabela pai.
* Nós podemos entender que uma chave estrangeira mantem a "integridade referencial".

### CREATE TABLE
* Principais tipos de restrições que podem ser aplicadas
* * **NOT NULL** - Não permite nulos
* * **unique** - Força que todos os valores em uma coluna sejam diferentes
* * **PRIMARY KEY** - Uma junção de NOT NULL e UNIQUE
* * **FOREIGN KEY** - identifica unicamente uma linha em outra tabela
* * **CHECK** - Força uma condição específica em uma coluna
* * **DEFAULT** - Força um valor padrão quando nenhum valor é passado
* * `CREATE TABLE nomeTabela (coluna1 tipo restricaoDaColuna, (coluna2 tipo restricaoDaColuna, (coluna3 tipo restricaoDaColuna ...);`
* * `CREATE TABLE Video (VideoID INT PRIMARY KEY, Nome VARCHAR(150) NOT NULL, Visualização INT DEFAULT 0, Likes INT DEFAULT 0, Dislikes INT DEFAULT 0, Duracao INT NOT NULL, CanalID INT FOREIGN KEY REFERENCES Canal(CanalId));`

### INSERT INTO
* usado para inserir dados em uma tabela
* * `INSERT INTO nomeTabela(coluna1, coluna2,...) VALUES(valor1,valor2)`
* * `INSERT INTO tbelaA (coluna1) SELECT coluna2 FROM tabelaB`
* A instrução INSERT tem o seguinte formato: INSERT INTO tablename VALUES ( value1, value2 , ...) Nessa sintaxe, tablename é o nome da tabela ou visualização na qual você deseja inserir dados e value1, value2 (e assim por diante) são os valores inseridos.

### UPDATE
* permite atualizar dados em uma coluna de um registro em uma tabela, ou todas as colunas em todos os registros na tabela.
* * `UPDATE nomeTabela SET coluna1 = valor1 coluna2 = valor2 WHERE condicao`
* * `UPDATE aula SET nome = 'Aula1' WHERE id = 1`

### DELETE
* Usado para deletar linhas da tabela. Obs: se não colocar a condição, será deletado todas as linhas da tabela.
* * `DELETE FROM nomeTabela WHERE condicao`
* * `DELETE FROM aula WHERE Nome = 'Aula 4'`

### ALTER TABLE
* 
* * `ALTER TABLE nomeDaTabela ACAO`
* * Add, Remover, ou alterar uma coluna
* * Setar valores padrões para uma coluna
* * Add ou Remover restrições de colunas
* * Renomer uma tabela ou coluna
* * `ALTER TABLE youtube ADD ativo BIT`
* * `ALTER TABLE youtube ALTER COLUMN categoria varchar(300) NOT NULL`
* * `EXEC sp_RENAME 'youtube.Nome', 'nomeCanal' 'COLUMN'`