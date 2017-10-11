SELECT 'Choose a query.';
RETURN;

CREATE TABLE #one
(
   id INT NOT NULL
  ,stringValue VARCHAR(10) NOT NULL
  ,moneyValue MONEY NOT NULL 
);

CREATE TABLE #two
(
   id INT NOT NULL
  ,stringValue VARCHAR(10) NOT NULL
  ,anotherString VARCHAR(10) NOT NULL 
);

INSERT #one
(id, stringValue, moneyValue)
VALUES  
 (1, 'Hello', 10.00)
,(2, 'World', 20.00);

INSERT #two
(id, stringValue, anotherString)
VALUES  
 (1, 'One', 'Fish')
,(2, 'Two', 'Fish')
,(2, 'Red', 'Fish');

SELECT *
FROM #one o
CROSS JOIN #two;

-----------------------------

CREATE TABLE #darts
(
  playerName VARCHAR(20) NOT NULL
);

INSERT #darts
(playerName)
VALUES  
('Chris')
,('Andy')
,('Eric')
,('Peter')

SELECT *
FROM #darts d
CROSS JOIN #darts d2
WHERE d.playerName <> d2.playerName;

DROP TABLE #darts;
