-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

datos = LOAD 'data.tsv' USING PigStorage('\t') 
    AS (letra:CHARARRAY, 
        fecha:CHARARRAY,
        cantidad:INT);
DUMP datos;

dataorder = ORDER datos BY cantidad;
DUMP dataorder;
dataorder2 = FOREACH  dataorder GENERATE cantidad ; 
DUMP dataorder2;

dataorder3 = LIMIT dataorder2 5;
DUMP dataorder3;

STORE dataorder3 INTO 'output' using PigStorage('\t');