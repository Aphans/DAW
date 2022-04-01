CREATE OR REPLACE VIEW DEPT10 
AS SELECT  * FROM EMPLE
WHERE SALARIO>1200 AND DEPT_NO =10
WITH CHECK OPTION;/*Para que no pueda insertarse en la tabla normal si no se cumple el WHERE*/

WITH READ ONLY /*Solo lectura*/

