/* ALL EXAMPLE*/
Find all products with a price that's greater than all of the products in the 'Luxury' category:
SELECT *
  FROM PRODUCTS
 WHERE PRICE > ALL (SELECT PRICE	
					  FROM PRODUCTS
					 WHERE CATEGORY='Luxury');