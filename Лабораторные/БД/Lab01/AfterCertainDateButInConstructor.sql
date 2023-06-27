SELECT ЗАКАЗЫ.*, Дата_поставки AS Expr1
FROM     ЗАКАЗЫ
WHERE  (Дата_поставки > CONVERT(DATETIME, '2022-01-01 00:00:00', 102))