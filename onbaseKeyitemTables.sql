DECLARE @number INT = 0;
DECLARE @query VARCHAR(1000);

WHILE @number <= 156 --I think that is the highest value in the database currently
BEGIN 
  SET @query = 'SELECT TOP 5 * FROM onbase.hsi.keyitem' + CONVERT(VARCHAR(3), @number) + ';';
  SELECT @number, @query;

  EXECUTE(@query);

  SET @number = @number + 1;
END;
