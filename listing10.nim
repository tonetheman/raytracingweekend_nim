

import vec
import ray
import color

proc hit_sphere(center : point3, radius : float, r : ray) : bool =
    let oc = r.origin() - center
    let a = dot(r.direction(), r.direction())
    let b = 2.0 * dot(oc, r.direction())
    let c = dot(oc,od) - radius*radius
    let discriminant = b*b - 4*a*c
    return discriminant > 0

proc ray_color(r : ray) : color3 =
    if hit_sphere(point3(x:0,y:0,z:0),0.5,r):
      return color3(x:1,y:0,z:0)
    var unit_direction = unit_vector(r.direction())
    let t = 0.5 * (unit_direction.y+1.0)
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
