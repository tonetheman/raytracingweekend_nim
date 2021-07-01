
import vec

proc test_plusequals() =
  var v1 = makevec3(0,0,0)
  echo(v1)

  for i in 0 ..< 100:
    v1 += 10.0

  echo(v1)

  var v2 = makevec3(0,0,0)
  echo(v2)
  for i in 0 ..< 100:
    v2 += 10
  echo(v2)

test_plusequals()