

import vec
import wcolor

const image_width  =  256
const image_height = 256

echo "P3"
echo image_width, " ", image_height
echo "255"

for j in countdown(image_height-1,0):
    for i in 0..<image_width:
        var pixel_color = makevec3(
            float(i)/(image_width-1),
            float(j)/(image_height-1),
            0.25)

        write_color(stdout, pixel_color)

