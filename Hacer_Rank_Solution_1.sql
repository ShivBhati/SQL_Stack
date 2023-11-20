SELECT 
    TOP 1 
    CITY
    ,LEN(CITY) AS LEN 
FROM
    STATION 
GROUP BY 
    CITY 
ORDER BY 
    LEN(CITY) DESC;

SELECT 
    TOP 1 
    * 
FROM 
    (
        SELECT 
            TOP 3 
            CITY
            ,LEN(CITY) AS LEN 
        FROM 
            STATION 
        GROUP BY 
            CITY 
        ORDER BY 
            LEN(CITY) ASC
    )
    STATION 
ORDER BY 
    CITY ASC;