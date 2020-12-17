
type vec3* = object
  x* : float
  y* : float
  z* : float

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

