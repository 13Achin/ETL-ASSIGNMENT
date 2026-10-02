CREATE TABLE orders (
    Order_ID     VARCHAR(10) PRIMARY KEY,
    Customer_ID  VARCHAR(10),
    Sales_Amount DECIMAL(10,2),
    Order_Date   DATE
);

-- Find non-numeric values (SQL Server) --
SELECT * FROM staging_orders
WHERE TRY_CAST(Sales_Amount AS DECIMAL(10,2)) IS NULL;