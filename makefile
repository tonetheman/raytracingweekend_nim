
all : testvec listing7


listing7 : listing7.nim color.nim vec.nim
	nim c listing7.nim

testvec : testvec.nim vec.nim
	nim c testvec.nim

clean :
	rm -f testoo
	rm -f testvec
	rm -f listing7
