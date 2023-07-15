SELECT A.HOUR, COUNT(B.TIME) AS COUNT
FROM (
        SELECT LEVEL-1 HOUR 
        FROM DUAL CONNECT BY LEVEL < 25
     ) A,
     (  
        SELECT TO_CHAR(DATETIME,'HH24') TIME 
        FROM ANIMAL_OUTS
     ) B
WHERE A.HOUR = B.TIME(+)
GROUP BY A.HOUR
ORDER BY A.HOUR