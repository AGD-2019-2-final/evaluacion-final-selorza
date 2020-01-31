import sys
#
#  >>> Escriba el codigo del mapper a partir de este punto <<<
#
if __name__=="__main__":
	for linea in sys.stdin:
		letra=linea.split("   ")[0]
		fecha=linea.split("   ")[1]
		numero=int(linea.split("   ")[2])
		numero=str(numero)
		numero=numero.zfill(3)
		concat=letra+numero
		sys.stdout.write("{}\t{}\t{}\t{}\n".format(concat,letra,fecha,numero))