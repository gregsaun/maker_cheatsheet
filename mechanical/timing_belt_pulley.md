# Mechanical Cheat Sheet



## Timing Belt and Pulley

### Table of contents
* [Glossary](#glossary)
* [Gates 2GT Specifications](#gates-2gt-specifications)
* [Gates GT3 Specifications](#gates-gt3-specifications)
* [Pulley Outside Diameter](#pulley-outside-diameter)



### Glossary

![Belt and Pulley Glossary](img/belt_pulley_glossary.jpg)



### Gates 2GT Specifications

2GT belts are manufactured by an affiliate company of Gates called "Gates Unitta", in Asia. Gates 2GT belts are compatible with GT2 and GT3 but are lower quality and they could lead to an increase in backlash, specially on a 3D printer.

![Gates 2GT 3GT Drawing](img/2gt_3gt_specs.jpg)



### Gates GT3 Specifications

GT2 and GT3 belts have same dimensions and are compatible. GT3 are new version with a better structure.

![Gates GT3 2mm Drawing](img/gt3_2mm_specs.jpg)
![Gates GT3 3mm Drawing](img/gt3_3mm_specs.jpg)



### Pulley Outside Diameter

`pd = P*N / π`

`O.D. = pd - 2*U`

Where
  * pd = pitch diameter
  * P = belt pitch
  * N = number of pulley teeth
  * O.D. = pulley outside diameter
  * U = Distance from Pitch Line to Belt Tooth Bottom 
    * U = 0.254mm for 2GT and GT2/3 2mm pitch belts
    * U = 0.381mm for 3GT and GT2/3 3mm pitch belts

Example for GT3 2mm pitch and 20T pulley :
  * `pd = 2 * 20 / π = 12.732mm`
  * `O.D. = 12.732 - 2*0.254 = 12.224mm`



### Sources

  * [Openbuilds](https://openbuildspartstore.com/3gt-gt2-3m-timing-belt-by-the-foot/)
  * [SPD/SI](http://www.sdp-si.com/PDFS/Technical-Section-Timing.pdf)