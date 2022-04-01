DELETE FROM DEPART WHERE DEPT_NO NOT IN (SELECT DEPART.DEPT_NO FROM DEPART 
                                    JOIN EMPLE ON EMPLE.DEPT_NO = DEPART.DEPT_NO 
                                    GROUP BY DEPART.DEPT_NO
                                    HAVING COUNT(*)>0);