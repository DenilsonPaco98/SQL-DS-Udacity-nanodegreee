/* Problem 1 - result 39rows 
Forneça uma tabela para todos os web_events associados ao nome da conta de Walmart. Deve haver três colunas. Certifique-se de incluir o primary_poc, a hora do evento e o channelde cada evento. Além disso, você pode optar por adicionar uma quarta coluna para garantir que apenas Walmartos eventos sejam escolhidos.*/
SELECT a.primary_poc, w.occurred_at,w.channel, a.name
FROM web_events w
JOIN accounts a
ON w.account_id = a.id
WHERE a.name LIKE 'Walmart';


/* Problem 2 result 351 rows
Forneça uma tabela que forneça a região para cada sales_rep junto com suas contas associadas . Sua tabela final deve incluir três colunas: o nome da região , o nome do representante de vendas e o nome da conta . Classifique as contas em ordem alfabética (AZ) de acordo com o nome da conta.*/
SELECT r.name REGIon, s.name REP_VENDAS, a.name NOME_CONTA
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
ORDER BY a.name;


/*
Forneça o nome de cada região para cada pedido , bem como o nome da conta e o preço unitário pago (total_amt_usd/total) pelo pedido. Sua tabela final deve ter 3 colunas: region name , account name e unit price . Algumas contas têm 0 para total , então dividi por (total + 0,01) para garantir que não divida por zero.*/
SELECT r.name , a.name , o.total_amt_usd/(o.total + 0.01) price_unit
FROM region r
JOIN sales_reps s
ON s.region_id = r.id
JOIN accounts a
ON a.sales_rep_id = s.id
JOIN orders o
ON o.account_id = a.id;











