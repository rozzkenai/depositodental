select * from demo_Main
select * from demo_TabA
select * from demo_TabB

declare @tabName varchar(max)
declare @colName varchar(max)
declare @message varchar(max)


select * from demo_Main where job = 1

DECLARE vend_cursor CURSOR  
    FOR select tableName, columnName from demo_Main where job = 1
OPEN vend_cursor  
FETCH NEXT FROM vend_cursor
INTO @tabName, @colName

WHILE @@FETCH_STATUS = 0  
BEGIN 
	
    SELECT @message = ('select ' +  @colName + ' as tableCOL from ' + @tabName)

	PRINT @message
	PRINT ' UNION ALL '  

        -- Get the next vendor.  
    FETCH NEXT FROM vend_cursor   
    INTO @tabName, @colName        
END
CLOSE vend_cursor;  
DEALLOCATE vend_cursor;  
