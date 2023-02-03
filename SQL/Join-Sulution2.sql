/* Probem 1 - Result 48 rows
Forneça uma tabela que forneça a região para cada sales_rep junto com suas contas associadas . 
Desta vez apenas para a Midwestregião. 
Sua tabela final deve incluir três colunas: o nome da região , o nome do representante de vendas e o nome da conta . 
Classifique as contas em ordem alfabética (AZ) de acordo com o nome da conta.
*/
SELECT r.name region_name, s.name vendedor_nome, a.name name_count
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
WHERE r.name LIKE 'Midwest'
ORDER BY a.name;

/* Problem 2 - Result in 5 row
Forneça uma tabela que forneça a região para cada sales_rep junto com suas contas associadas . 
Desta vez, apenas para contas em que o representante de vendas tem um nome começando com Se na Midwestregião. 
Sua tabela final deve incluir três colunas: o nome da região , o nome do representante de vendas e o nome da conta . 
Classifique as contas em ordem alfabética (AZ) de acordo com o nome da conta.
*/
SELECT r.name region_name, s.name vendedor_nome, a.name name_count
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
WHERE s.name LIKE 'S%' 
AND r.name LIKE 'Midwest'
ORDER BY a.name;


/* Problem 3- Solution in 13 rows - Tive dificuldade
Forneça uma tabela que forneça a região para cada sales_rep junto com suas contas associadas . 
Desta vez, apenas para contas em que o representante de vendas tem um sobrenome começando com Ke na Midwestregião. 
Sua tabela final deve incluir três colunas: o nome da região , o nome do representante de vendas e o nome da conta . 
Classifique as contas em ordem alfabética (AZ) de acordo com o nome da conta.
*/
SELECT r.name region_name, s.name vendedor_nome, a.name name_count
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
WHERE s.name NOT LIKE 'K%'
AND s.name LIKE '%K%'
AND r.name LIKE 'Midwest';

/*Problem 4 - Solution in 4509 rows - Tive duvida na interpretação do problema.
Forneça o nome de cada região para cada pedido , bem como o nome da conta e o preço unitário pago (total_amt_usd/total) pelo pedido. 
No entanto, você só deve fornecer os resultados se a quantidade padrão do pedido exceder 100. 
Sua tabela final deve ter 3 colunas: region name , account name e unit price . 
Para evitar um erro de divisão por zero, adicionar 0,01 ao denominador aqui é útil total_amt_usd/(total+0,01).
*/
SELECT r.name region_name, a.name accoun_name, o.total_amt_usd/(o.total + 0.01) unite_price
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN orders o
ON a.id = o.account_id
WHERE  o.standard_qty > 100;

/* Problem 5 - Solution in 835 rows.
Forneça o nome de cada região para cada pedido , bem como o nome da conta e o preço unitário pago (total_amt_usd/total) pelo pedido. 
No entanto, você só deve fornecer os resultados se a quantidade do pedido padrão exceder 100e a quantidade do pedido do pôster exceder 50. 
Sua tabela final deve ter 3 colunas: region name , account name e unit price . Ordene primeiro pelo menor preço unitário . 
Para evitar um erro de divisão por zero, adicionar 0,01 ao denominador aqui é útil (total_amt_usd/(total+0,01).
*/
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price DESC;

/* Problem 6 - Solution in 835 rows 
Forneça o nome de cada região para cada pedido , bem como o nome da conta e o preço unitário pago (total_amt_usd/total) pelo pedido. 
No entanto, você só deve fornecer os resultados se a quantidade do pedido padrão exceder 100e a quantidade do pedido do pôster exceder 50. 
Sua tabela final deve ter 3 colunas: region name , account name e unit price . Ordene primeiro pelo maior preço unitário . 
Para evitar um erro de divisão por zero, adicionar 0,01 ao denominador aqui é útil (total_amt_usd/(total+0,01).
*/
SELECT r.name region, a.name account, o.total_amt_usd/(o.total + 0.01) unit_price
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id
WHERE o.standard_qty > 100 AND o.poster_qty > 50
ORDER BY unit_price DESC;

/* Problem 7 - Solution in 6 rows 
Quais são os diferentes canais usados pelo ID da conta 1001 ? Sua tabela final deve ter apenas 2 colunas: nome da conta e os diferentes canais . 
Você pode tentar SELECT DISTINCT para restringir os resultados apenas aos valores exclusivos.
*/
SELECT DISTINCT w.channel canais , a.name nome_conta, a.id 
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
WHERE a.id = 1001

/*Problem 8 -Solution in 1725 rows 
Encontre todos os pedidos que ocorreram em 2015. 
Sua tabela final deve ter 4 colunas: ocorreu_em , nome da conta , total do pedido e total_amt_usd do pedido .
*/
SELECT o.occurred_at, a.name, o.total, o.total_amt_usd
FROM accounts a
JOIN orders o
ON o.account_id = a.id
WHERE o.occurred_at BETWEEN '01-01-2015' AND '01-01-2016'
ORDER BY o.occurred_at DESC;



