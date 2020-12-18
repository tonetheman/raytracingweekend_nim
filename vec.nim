
import math as m

type vec3* = object
  x* : float
  y* : float
  z* : float

type point3* = vec3
type color* = vec3

proc makevec3*(x : float = 0.0, y : float = 0.0,
z : float = 0.0) : vec3 =
  result.x = x
  result.y = y
  result.z = z

# setter
proc `[]=`* (v : var vec3, i : int, val : float) =
  case i
  of 0: v.x = val
  of 1: v.y = val
  of 2: v.z = val
  else: assert(false)

# getter
proc `[]`* (v : vec3, i : int) : float =
  case i
  of 0: result = v.x
  of 1: result = v.y
  of 2: result = v.z
  else: assert(false)

proc `-`*(v : vec3) : vec3 =
  result.x = - v.x
  result.y = - v.y
  result.z = - v.z

proc `+=`*(v : var vec3, other : vec3) =
  v.x += other.x
  v.y += other.y
  v.z += other.z

proc `*=`*(v : var vec3, f : float) =
  v.x *= f
  v.y *= f
  v.z *= f
  
proc `/=`*(v : var vec3, f : float ) =
  v *= 1/f

proc length_squared*(v : vec3) : float =
  return v.x*v.x + v.y*v.y + v.z*v.z

#[
  TODO: seems gross to do copy/paste this
  for a var version vs not a var version?
]#
proc length*(v : var vec3) : float =
  return m.sqrt(length_squared(v))
proc length*(v : vec3) : float =
  return m.sqrt(length_squared(v))

proc `+`*(v1, v2 : vec3) : vec3 =
  result.x = v1.x + v2.x
  result.y = v1.y + v2.y
  result.z = v1.z + v2.z
proc `-`*(v1, v2 : vec3) : vec3 =
  result.x = v1.x - v2.x
  result.y = v1.y - v2.y
  result.z = v1.z - v2.z
proc `*`*(v1, v2 : vec3) : vec3 =
  result.x = v1.x * v2.x
  result.y = v1.y * v2.y
  result.z = v1.z * v2.z

proc `*`*(v : vec3, f : float) : vec3 =
  # echo "first mult: ",v,f
  result.x = v.x * f
  result.y = v.y * f
  result.z = v.z * f
  # echo "result is ",result

proc `*`*(f : float, v : vec3) : vec3 =
  # echo "second mult: ",f,v
  return v * f

proc `/`*(v : vec3, t : float) : vec3 =
  return v * (1/t)

proc dot*(u : vec3,  v : vec3) : float =
  return ( u.x * v.x +
    u.y * v.y +
    u.z * v.z )

proc cross*(u : vec3, v : vec3) : vec3 =
  result.x = u[1] * v[2] - u[2]*v[1]
  result.y = u[2] * v[0] - u[0]*v[2]
  result.z = u[0] * v[1] - u[1]*v[0]

proc unit_vector*(v : vec3) : vec3 =
  return v / v.length()
