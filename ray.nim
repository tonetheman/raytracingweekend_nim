
import vec

type ray* = object
    orig* : vec3
    dir* : vec3

proc makeray*(origin : vec3, direction : vec3) : ray =
    result.orig = origin
    result.dir = direction

proc origin*(r : ray) : vec3 =
    return r.orig

proc direction*(r : ray) : vec3 =
    return r.dir

proc at*(r : ray, t : float) : vec3 =
    return r.orig + (r.dir * t)


