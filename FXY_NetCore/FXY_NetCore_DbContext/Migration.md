
- [官方文档](https://docs.microsoft.com/en-us/ef/core/managing-schemas/migrations/)
### 启动迁移

	Add-Migration MigrationName -Context DefaultMySqlContext -OutPutDir Migrtion\MySqlMigrations

- `MigrationName`:迁移名称
- `-Context`:指定上下文名称
- `-OutPutDir`:迁移文件输入路径

### 获取脚本
	Script-Migration -From StartMigration -To EndMigration

- `-From`:迁移起始版本，可以输入名称或id。
- `-To`:迁移结束版本，可以输入名称或id。

### 更新数据库
	Update-DataBase

