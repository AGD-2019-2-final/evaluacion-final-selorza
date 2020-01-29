import sys
#
# >>> Escriba el codigo del mapper a partir de este punto <<<
#


if __name__ == "__main__":
    for line in sys.stdin:
        dato_columna = line.split(',')[2]
        #valor = line.split(',')[4]
        sys.stdout.write("{}\t1\n".format(dato_columna)) 