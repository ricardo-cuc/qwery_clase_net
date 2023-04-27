SELECT 
    'public ' + 
    CASE 
        WHEN COLUMNPROPERTY(OBJECT_ID(TABLE_SCHEMA + '.' + TABLE_NAME), COLUMN_NAME, 'IsIdentity') = 1 THEN 'int'
        ELSE CASE DATA_TYPE 
            WHEN 'bigint' THEN 'long'
            WHEN 'binary' THEN 'byte[]'
            WHEN 'bit' THEN 'bool'
            WHEN 'char' THEN 'string'
            WHEN 'date' THEN 'DateTime'
            WHEN 'datetime' THEN 'DateTime'
            WHEN 'datetime2' THEN 'DateTime'
            WHEN 'datetimeoffset' THEN 'DateTimeOffset'
            WHEN 'decimal' THEN 'decimal'
            WHEN 'float' THEN 'double'
            WHEN 'geography' THEN 'Microsoft.SqlServer.Types.SqlGeography'
            WHEN 'geometry' THEN 'Microsoft.SqlServer.Types.SqlGeometry'
            WHEN 'hierarchyid' THEN 'Microsoft.SqlServer.Types.SqlHierarchyId'
            WHEN 'image' THEN 'byte[]'
            WHEN 'int' THEN 'int'
            WHEN 'money' THEN 'decimal'
            WHEN 'nchar' THEN 'string'
            WHEN 'ntext' THEN 'string'
            WHEN 'numeric' THEN 'decimal'
            WHEN 'nvarchar' THEN 'string'
            WHEN 'real' THEN 'float'
            WHEN 'smalldatetime' THEN 'DateTime'
            WHEN 'smallint' THEN 'short'
            WHEN 'smallmoney' THEN 'decimal'
            WHEN 'sql_variant' THEN 'object'
            WHEN 'text' THEN 'string'
            WHEN 'time' THEN 'TimeSpan'
            WHEN 'timestamp' THEN 'byte[]'
            WHEN 'tinyint' THEN 'byte'
            WHEN 'uniqueidentifier' THEN 'Guid'
            WHEN 'varbinary' THEN 'byte[]'
            WHEN 'varchar' THEN 'string'
            WHEN 'xml' THEN 'string'
            ELSE 'UNKNOWN_' + DATA_TYPE
        END
    END + 
    CASE 
        WHEN IS_NULLABLE = 'NO' THEN ''
        ELSE '?'
    END + 
    ' ' + COLUMN_NAME + ' { get; set; }'
FROM 
    INFORMATION_SCHEMA.COLUMNS
WHERE 
    TABLE_NAME = 'nombre_tabla'
    AND TABLE_SCHEMA = 'esquema'
