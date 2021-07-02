
import vec
import ray
import wcolor
import math

proc hit_sphere(center : point3, radius : float, r : ray) : float =
    let oc = r.origin() - center
    let a = dot(r.direction(), r.direction())
    let b = 2.0 * dot(oc, r.direction())
    let c = dot(oc,oc) - radius*radius
    let discriminant = b*b - 4*a*c
    if discriminant < 0:
        return -1.0
    else:
        return (-b - sqrt(discriminant)) / (2.0*a)

proc ray_color(r : ray) : color =
    var t = hit_sphere(point3(x: 0,y: 0,z: -1),0.5,r)
    if t > 0.0:
        let N = unit_vector(r.at(t) - vec3(x:0, y:0, z: -1))
        return 0.5 * color(x: N.x+1, y: N.y+1, z: N.z+1)
    
    var unit_direction = unit_vector(r.direction())
    t = 0.5 * (unit_direction.y+1.0)
    return  (makevec3(1,1,1)*(1.0-t)) + (makevec3(0.5,0.7,1.0)*t)


const aspect_ratio = 16.0/9.0
const image_width = 400
const image_height = int(image_width/aspect_ratio)

const viewport_height = 2.0
const viewport_width = aspect_ratio * viewport_height
const focal_length = 1.0

let origin = makevec3(0,0,0)
let horizontal = makevec3(viewport_width,0,0)
let vertical = makevec3(0,viewport_height,0)
let lower_left_corner = origin - horizontal/2 - vertical/2 - makevec3(0,0,focal_length)

write(stdout,"P3\n")
write(stdout,$(image_width) & " " & $(image_height) & "\n")
write(stdout,"255\n")

for j in countdown(image_height-1,0):
    for i in 0..<image_width:
        let u = float(i)/(image_width-1)
        let v = float(j)/(image_height-1)
        var r = makeray(origin,lower_left_corner+(u*horizontal) + (v*vertical) - origin)
        let pixel_color = ray_color(r)
        write_color(stdout,pixel_color)
