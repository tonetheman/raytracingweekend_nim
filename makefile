
all : tt rt testoo testvec


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
