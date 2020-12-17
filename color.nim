
import vec

proc write_color*(outf : File, pixel_color : color) =
    outf.write(
        $(int(255.999 * pixel_color.x)) &
    " " & $(int(255.999*pixel_color.y)) &
    " " & $(int(255.999*pixel_color.z)) &
    "\n")
