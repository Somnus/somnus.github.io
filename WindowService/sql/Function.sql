/*ֱ�Ӵ����������ݿ��ֶνű�����ֶ�����*/
DROP PROCEDURE IF EXISTS xlypos_dev_2_2_add_index;
CREATE DEFINER=current_user PROCEDURE `xlypos_dev_2_2_add_index`(IN `str` VARCHAR(500) )
BEGIN

SET @sqlScript = REPLACE ( `str`, ';', '' );/*�ű���ϴ*/

SET @tableName = SUBSTRING_INDEX( SUBSTRING_INDEX( @sqlScript, ' ', 3 ), ' ',- 1 );/*������*/
SET @columnName = SUBSTRING_INDEX( SUBSTRING_INDEX( @sqlScript, ' ',- 2 ), ' ', 1 );/*�ֶ�����*/
SET @format = SUBSTRING_INDEX( SUBSTRING_INDEX( @sqlScript, ' ',- 2 ), ' ',- 1 );/*�ֶθ�ʽ*/

SET @addScript = CONCAT( 'ALTER TABLE ', @tableName, ' ADD', ' COLUMN ', @columnName, ' ', @format, ';' );/*ƴ�������ֶ�Sql���*/
SELECT COUNT( * ) INTO @count FROM information_schema.`COLUMNS` WHERE TABLE_SCHEMA = '"
+ _dbName +
 @"' AND TABLE_NAME = @tableName AND COLUMN_NAME = @columnName ;/*�����Բ�ѯ*/

IF @count = 0 THEN
		PREPARE stmp FROM @addScript;
		EXECUTE stmp;
		DEALLOCATE PREPARE stmp;
END IF;
END;
"