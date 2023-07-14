SELECT CATEGORY, PRICE, PRODUCT_NAME
FROM FOOD_PRODUCT
WHERE (CATEGORY,PRICE) IN (SELECT CATEGORY, MAX(PRICE) AS PRICE
                           FROM FOOD_PRODUCT
                           GROUP BY CATEGORY
                           HAVING CATEGORY IN ('과자', '국', '김치', '식용유')
                          )
ORDER BY PRICE DESC