
all : tt rt testoo testvec listing7


listing7 : listing7.nim color.nim vec.nim
	nim c listing7.nim

testvec : testvec.nim vec.nim
	nim c testvec.nim

testoo : testoo.nim
	nim c testoo.nim

rt : rt.nim
	nim c rt.nim

tt : tt.nim
	nim c tt.nim

clean :
	rm -f tt
	rm -f rt
	rm -f testoo
	rm -f testvec
