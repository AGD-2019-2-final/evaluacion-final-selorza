-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
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

datostmp= FOREACH datos GENERATE FLATTEN(bolsa) as letra;
dump datostmp;


resumen= group datostmp by letra;
dump resumen;

conteo = FOREACH resumen GENERATE group, COUNT(datostmp);
dump conteo;

store conteo into 'output' using PigStorage('\t');
