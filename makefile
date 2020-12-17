
all : testvec listing7 listing9


listing9 : listing9.nim vec.nim color.nim ray.nim
	nim c listing9.nim

listing7 : listing7.nim color.nim vec.nim
	nim c listing7.nim

testvec : testvec.nim vec.nim
	nim c testvec.nim

clean :
	rm -f testoo
	rm -f testvec
	rm -f listing7
	rm -f listing9
