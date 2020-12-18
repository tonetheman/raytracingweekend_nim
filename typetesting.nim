
type v3 = object
  x : float
  y : float
  z : float

#[
# mult defined first with v3 first then scalar
# then defined again with scalar first then v3
# the latter is defined in terms of the first operator
]#
proc `*`(v : v3, f : float) : v3 {.inline.} =
  result.x = v.x * f
  result.y = v.y * f
  result.z = v.z * f
proc `*`(f : float, v : v3) : v3 {.inline.} =
  return v * f


#[
]#
proc `/`(v : v3, f : float) : v3 {.inline.} =
  result.x = v.x/f
  result.y = v.y/f
  result.z = v.z/f
proc `/`(f : float, v : v3) : v3 {.inline.} =
  result.x = f/v.x
  result.y = f/v.y
  result.z = f/v.z

#[
# same as mult, defined the v3,scalar signature first
# define the second proc scalar,v3 in terms of the first
]#
proc `+`(v : v3, f : float) : v3 {.inline.} =
  result.x = v.x+f
  result.y = v.y+f
  result.z = v.z+f
proc `+`(f : float, v : v3) : v3 {.inline.} =
  return v+f

# testing
let v1 = v3(x:1,y:2,z:3)
echo 10 * v1
echo v1 * 5
echo v1/10
echo 10/v1
echo 3+v1
echo v1+3

