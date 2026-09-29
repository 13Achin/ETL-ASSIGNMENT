/** Q.7: Q.7 : Write an SQL query on sales transactions to list all duplicate keys and their counts using the business key (Customer_ID + Product_ID + Txn_Date + Txn_Amount ).**/
/** Ans **/

SELECT
    Customer_ID,
    Product_ID,
    Txn_Date,
    Txn_Amount,
    COUNT(*) AS duplicate_count
FROM sales_transactions
GROUP BY
    Customer_ID,
    Product_ID,
    Txn_Date,
    Txn_Amount
HAVING COUNT(*) > 1;

SELECT t.*
FROM sales_transactions t
JOIN (
    SELECT Customer_ID, Product_ID, Txn_Date, Txn_Amount
    FROM sales_transactions
    GROUP BY Customer_ID, Product_ID, Txn_Date, Txn_Amount
    HAVING COUNT(*) > 1
) d
  ON  t.Customer_ID = d.Customer_ID
  AND t.Product_ID  = d.Product_ID
  AND t.Txn_Date    = d.Txn_Date
  AND t.Txn_Amount  = d.Txn_Amount
ORDER BY t.Customer_ID, t.Txn_ID;

/** Q.8: Enforcing Referential Integrity Assume the following Customer_Master table.
CustomerID C101 C102 C103 C104 Rahul Mehta CustomerName Mumbai Bengaluru Chennai Delhi Anjali Rao Suresh Iyer Neha Singh City
Identify Sales_Transactions.Customer_ID values that violate referential integrity when joined with Customers_Master and write a query to detect such violations.
**/

/** Ans **/

SELECT
    s.Txn_ID,
    s.Customer_ID
FROM sales_transactions s
LEFT JOIN customer_master c
       ON s.Customer_ID = c.CustomerID
WHERE c.CustomerID IS NULL;

SELECT s.Customer_ID, COUNT(*) AS orphan_txn_count
FROM sales_transactions s
LEFT JOIN customer_master c
       ON s.Customer_ID = c.CustomerID
WHERE c.CustomerID IS NULL
GROUP BY s.Customer_ID;

