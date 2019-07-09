# 3D Printing Cheat Sheet

## Techniques

### Table of contents
* [Selective Infill](#selective-infill)
* [Clean Vertical Hole](#clean-vertical-hole)
* [Sharp Angle](#sharp-angle)
* [Flow Rate](#flow-rate)
* [SCAD to STEP Conversion](#scad-to-step-conversion)
* [Sanding](#sanding)



### Selective Infill

Selective infill is a technique used to create solid perimeters in middle of the infill of a printed part to increase stiffness. To achieve this we create a hole in the middle of the infill, the slicer will then see the hole and create perimeters around it. It will also add top and bottoms layers for the holes.

Placed correctly, a selective infill can double the perimeters or top/bottom layers. To achieve this you need to know how thick are the bottom/top layers, how wide are the perimeters and what is the minimum size of hole you can apply.

Credits: Prusa's OpenScad files, thanks for sharing!

#### Min hole size

Slic3r and PrusaSlicer will consider a hole smaller or equal to 0.10mm x 0.10mm as a defect in the STL and will ignore it. I then usually use the value 0.101x0.101mm as the minimum hole size for selective infill. You can use bigger holes if you like and know what you are doing.

#### Perimeters width

The perimeters are overlapping each others so you need to take this overlap into account. Slic3r explains how to calculate the overlap here: [manual.slic3r.org/advanced/flow-math#spacing-paths](https://manual.slic3r.org/advanced/flow-math#spacing-paths)

Note: No overlap is applied for bridging but this will be very rarely useful when doing selective infill.

| Parameter          | Formula | Value Example |
|:------------------:|:-------:|:-----:|
| extrusion_width    |         | 0.45mm |
| layer_height       |         | 0.20mm |
| num_perimeters     |         | 4 |
| extrusion_spacing  | extrusion_width - layer_height * (1 - &pi;/4) | 0.4071mm |
| perimeters_width   | extrusion_width + (num_perimeters-1) * extrusion_spacing | 1.67mm |

#### Tops and bottoms thickness

| Parameter              | Formula | Value Example |
|:----------------------:|:-------:|:-----:|
| layer_height           |  | 0.20mm |
| num_top_bottom         |  | 5mm |
| top_bottom_thickness   | num_top_bottom * layer_height | 1mm |



### Clean Vertical Hole

Used to put more space on top of a vertical hole and avoid clean-up after printing. I first found this technique in Prusa OpenScad files but I have defined my own method to achieve a good result.

![Clean Vertical Hole Diagram](img/hole_cleaning_diagram.png)

Where
* h = layer_height
* a = 30°
* w = if the hole is too small, w will be equal or lower than 0. In this case I recommend to make the angle 'a' more vertical.

For holes smaller than 3mm diameter I make a simple triangle (no flat on top) with those values:
* h >= layer height
* a >= 30°
* w = 0



### Sharp Angle

When printing angles the filament take a small short-cut resulting in a rounded angle. After several tests (in PETG), I found that this geometry is doing perfectly squared angles. This is valid for angle printed perpendicularly to the bed.

![Perfect Angle Diagram](img/perfect_angle.png)

Where
* e = extrusion width
* a = angle (45° for a printed angle of 90°)



### Flow Rate

Tutorial on how to define flow rate and print speed range for your filament.

https://www.proto-pasta.com/blogs/how-to/leveling-up-your-printer-game-on-the-lulzbot-mini



### SCAD to STEP Conversion

Tutorial to convert OpenSCAD files to STEP files using FreeCAD

https://forum.lulzbot.com/viewtopic.php?t=243



### Sanding

To get smooth surface from a 3D print

Thanks to JKSniper for this technique : https://www.thingiverse.com/thing:2307550 and https://youtu.be/0vgynnYzo08

#### Material
* Sandpaper 200, 500 and 800
* Spray filler
* Spray paint (acrylic), glossy or matt
* Bowl big enough to put your part in
* Water (in the bowl)

#### Steps
1. Sand as much as you can the edges using 200 sandpaper. Regularly put the sandpaper in water. At the end, surface should be smooth and even
1. Clean the part and dry it carefully
1. Mount the part in a way that you can spray all around
1. Spray with filler and let dry. Depending on the first sanding, apply one or more layers
1. Sand using firs 500 and then 800 sandpaper until it is smooth everywhere. Regularly put the sandpaper in water.
1. Clean, rinse carefully the part and let it dry
1. Spray the acrylic paint
