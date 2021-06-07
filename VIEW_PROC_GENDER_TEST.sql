CREATE VIEW PRODUCT_SOLD_GENDER WITH SCHEMABINDING
AS
SELECT
P.PROD_ID, P.PROD_NAME, P.PROD_DESC, P.PROD_SUBCATEGORY, P.PROD_CATEGORY, C.CUST_GENDER,
SUM(S.QUANTITY_SOLD) AS TOTAL_SOLD
FROM
[dbo].[FP_SALES] AS S
JOIN [dbo].[FP_PRODUCTS] AS P ON S.PROD_ID= P.PROD_ID
JOIN [dbo].[FP_CUSTOMERS] AS C ON S.CUST_ID= C.CUST_ID
GROUP BY
P.PROD_ID, P.PROD_NAME, P.PROD_DESC, P.PROD_SUBCATEGORY, P.PROD_CATEGORY,C.CUST_GENDER

SELECT * FROM PRODUCT_SOLD_GENDER

CREATE PROC VW_PRODUCT_GENDER_SOLD 
( 
  @CUST_GENDER  NVARCHAR(2) 
) 
AS 
BEGIN 
SELECT 
PROD_ID, PROD_NAME, PROD_SUBCATEGORY, PROD_CATEGORY, CUST_GENDER, TOTAL_SOLD 
FROM PRODUCT_SOLD_GENDER 
WHERE CUST_GENDER = @CUST_GENDER
  
END;

EXECUTE VW_PRODUCT_GENDER_SOLD  'F'

EXECUTE PRODUCT_GENDER_SOLD  'F'