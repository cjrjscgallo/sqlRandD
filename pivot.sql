--https://stackoverflow.com/questions/15931607/convert-rows-to-columns-using-pivot-in-sql-server


SELECT QUOTENAME('Hello there');


DROP TABLE #yt;

CREATE TABLE #yt 
(
  [Store] int, 
  [Week] int, 
  [xCount] int
);

INSERT INTO #yt
(
  [Store], 
  [Week], [xCount]
)
VALUES
    (102, 1, 96),
    (101, 1, 138),
    (105, 1, 37),
    (109, 1, 59),
    (101, 2, 282),
    (102, 2, 212),
    (105, 2, 78),
    (109, 2, 97),
    (105, 3, 60),
    (102, 3, 123),
    (101, 3, 220),
    (109, 3, 87);

SELECT STUFF
(
  (
  SELECT ',' + QUOTENAME(Week) 
  FROM #yt
  GROUP BY Week
  ORDER BY Week
  FOR XML PATH(''), TYPE
  ).value('.', 'NVARCHAR(MAX)')
  ,1
  ,1
  ,''
);


DECLARE 
   @cols NVARCHAR(MAX)
  ,@query NVARCHAR(MAX)
;

SELECT @cols = STUFF((
                      SELECT ',' + QUOTENAME(Week) 
                      FROM #yt
                      GROUP BY Week
                      ORDER BY Week
                      FOR XML PATH(''), TYPE
                     ).value('.', 'NVARCHAR(MAX)')
                     ,1
                     ,1
                     ,'')

SELECT @cols;

SELECT 
  *
FROM
(
SELECT 
    d.departmentName
   ,atrm.abilityToRepayMethodName
FROM notedb.fnba.departmentAbilityToRepayMethod datrm
JOIN notedb.fnba.departments d
  ON d.departmentId = datrm.departmentId
JOIN notedb.fnba.abilityToRepayMethods atrm
  ON atrm.abilityToRepayMethodId = datrm.abilityToRepayMethodId
) dataSource
PIVOT
(
  COUNT(dataSource.abilityToRepayMethodName)
  FOR abilityToRepayMethodName IN ([Asset Depletion], [Ready Asset])
) results
;
