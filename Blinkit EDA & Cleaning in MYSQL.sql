#To check the 10 rows from the data
SELECT * FROM blinkit LIMIT 10;

#To cdescribe the data
describe blinkit; 

#o check any missing values in critical columns
SELECT 
    COUNT(*) - COUNT(Item_Weight) AS Missing_Item_Weight,
    COUNT(*) - COUNT(Item_Visibility) AS Missing_Item_Visibility,
    COUNT(*) - COUNT(Sales) AS Missing_Sales
FROM
    blinkit;

set sql_safe_updates =0;

#To check if any nulls values and if any then delete them
DELETE FROM blinkit 
WHERE
    Item_Weight IS NULL OR Sales IS NULL;

#Lets check the total items followed by Average,Minimum,Maximum of sales
SELECT 
    COUNT(*) AS Total_Items,
    AVG(Item_Visibility) AS Avg_Item_Visibility,
    AVG(Item_Weight) AS Avg_Item_Weight,
    AVG(Sales) AS Avg_Sales,
    MIN(Sales) AS Min_Sales,
    MAX(Sales) AS Max_Sales
FROM
    blinkit;

#Lets check the count of Item fat content
SELECT 
    Item_Fat_Content, COUNT(*) AS Count
FROM
    blinkit
GROUP BY Item_Fat_Content;

#Lets check the total_sales by Outlet type
SELECT 
    Outlet_Type, SUM(Sales) AS Total_Sales
FROM
    blinkit
GROUP BY Outlet_Type;

#So data is clean and read to export it to tableau
select * from blinkit;

