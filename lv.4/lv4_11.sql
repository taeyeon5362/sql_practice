SELECT A.MEMBER_NAME
        , B.REVIEW_TEXT
        , TO_CHAR(B.REVIEW_DATE,'YYYY-MM-DD') AS REVIEW_DATE
FROM MEMBER_PROFILE A JOIN REST_REVIEW B
ON A.MEMBER_ID = B.MEMBER_ID
WHERE A.MEMBER_NAME IN (
                            SELECT A.MEMBER_NAME
                            FROM MEMBER_PROFILE A JOIN REST_REVIEW B
                            ON A.MEMBER_ID = B.MEMBER_ID
                            GROUP BY A.MEMBER_NAME
                            ORDER BY COUNT(A.MEMBER_NAME) DESC
                            FETCH NEXT 1 ROWS ONLY
                       )
ORDER BY B.REVIEW_DATE ASC, B.REVIEW_TEXT ASC;
