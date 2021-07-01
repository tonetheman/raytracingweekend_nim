
all : testvec listing7 listing9 listing10 listing11


listing11 : listing11.nim vec.nim wcolor.nim ray.nim
	nim c listing11.nim

listing10 : listing10.nim vec.nim wcolor.nim ray.nim
	nim c listing10.nim

listing9 : listing9.nim vec.nim wcolor.nim ray.nim
	nim c listing9.nim

listing7 : listing7.nim wcolor.nim vec.nim
	nim c listing7.nim

testvec : testvec.nim vec.nim
	nim c testvec.nim

clean :
	rm -f testoo
	rm -f testvec
	rm -f listing7
	rm -f listing9
	rm -f listing10
	rm -f listing11