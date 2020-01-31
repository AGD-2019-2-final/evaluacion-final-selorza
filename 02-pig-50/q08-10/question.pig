-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
datos = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        bolsa:bag{(a:CHARARRAY)},
        mapa:map[]);
DUMP datos;

datos_flat = foreach datos generate FLATTEN($1),FLATTEN($2);

datos_sel= foreach datos_flat generate $0,$1;

datos_grupo = GROUP datos_sel BY ($0,$1);

datos_conteo = FOREACH datos_grupo GENERATE group , COUNT(datos_sel) AS conteo;

datos_ordenados = order datos_conteo BY $0,$1;

store datos_ordenados into 'output' using PigStorage('\t');



