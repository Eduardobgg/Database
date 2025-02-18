SELECT
    n.nspname AS esquema,
    c.relname AS tabla,
    a.attname AS columna,
    pg_catalog.format_type(a.atttypid, a.atttypmod) AS tipo_de_dato,
    col_description(a.attrelid, a.attnum) AS comentario,
    CASE
        WHEN contype = 'p' THEN 'Llave Primaria'
        WHEN contype = 'u' THEN 'UNIQUE'
        WHEN contype = 'f' THEN 'Llave Foránea'
        ELSE 'NINGUNA'
    END AS tipo_de_restriccion
FROM
    pg_catalog.pg_attribute a
JOIN
    pg_catalog.pg_class c ON a.attrelid = c.oid
JOIN
    pg_catalog.pg_namespace n ON c.relnamespace = n.oid
LEFT JOIN
    pg_catalog.pg_constraint con ON con.conrelid = c.oid AND con.conkey[1] = a.attnum
WHERE
    a.attnum > 0 
    AND NOT a.attisdropped
    AND n.nspname IN ('hospital_esquema')
ORDER BY
    esquema, tabla, columna;
