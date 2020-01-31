import sys
#
# >>> Escriba el codigo del reducer a partir de este punto <<<
#

if __name__ == '__main__':

    curkey = None
    total = 0
    n=0
    ##
    ## cada linea de texto recibida es una
    ## entrada clave \tabulador valor
    ##
    for line in sys.stdin:
    	if n<6:
	        texto,key,fecha,val = line.split("\t")
	        val = int(val)
	        sys.stdout.write("{}\t{}\t{}\n".format(key, fecha,val))
	        n+=1

    #sys.stdout.write("{},{}\n".format(curkey, total))