/*直接传入新增数据库字段脚本完成字段新增*/
DROP PROCEDURE IF EXISTS xlypos_dev_2_2_add_index;
CREATE DEFINER=current_user PROCEDURE `xlypos_dev_2_2_add_index`(IN `str` VARCHAR(500) )
BEGIN

SET @sqlScript = REPLACE ( `str`, ';', '' );/*脚本清洗*/

SET @tableName = SUBSTRING_INDEX( SUBSTRING_INDEX( @sqlScript, ' ', 3 ), ' ',- 1 );/*表名称*/
SET @columnName = SUBSTRING_INDEX( SUBSTRING_INDEX( @sqlScript, ' ',- 2 ), ' ', 1 );/*字段名称*/
SET @format = SUBSTRING_INDEX( SUBSTRING_INDEX( @sqlScript, ' ',- 2 ), ' ',- 1 );/*字段格式*/

SET @addScript = CONCAT( 'ALTER TABLE ', @tableName, ' ADD', ' COLUMN ', @columnName, ' ', @format, ';' );/*拼接新增字段Sql语句*/
SELECT COUNT( * ) INTO @count FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = '"
+ _dbName +
 @"' AND TABLE_NAME = @tableName AND COLUMN_NAME = @columnName ;/*存在性查询*/

IF @count = 0 THEN
		PREPARE stmp FROM @addScript;
		EXECUTE stmp;
		DEALLOCATE PREPARE stmp;
END IF;
END;
"