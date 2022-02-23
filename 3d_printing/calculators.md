# 3D Printing Cheat Sheet

## Calculators



### Table of contents
* [Extrusion Multiplier](#extrusion_multiplier)
* [Extruder steps/mm](#extruder_steps_mm)
* [Part Scaling](#part_scaling)
* [Pulley Diameters](#pulley_diameters)
* [Resources](#resources)



### Extrusion Multiplier

![\textit{extrusion multiplier}=\frac{\textit{original extrusion multiplier} \cdot \textit{extrusion width}}{\textit{perimeter thickness}}](img/formula_extrusion_multiplier_01.png)

Where:
| variable | description |  unit |
|:---------|:------------|:-----:|
| *extrusion&nbsp;multiplier* | extrusion multiplier adjusted | |
| *original&nbsp;extrusion&nbsp;multiplier* | original extrusion multiplier set in your slicer | |
| *extrusion&nbsp;width* | extrusion width set in your slice (0.45mm if you are using a 0.4mm nozzle and PrusaSlicer) | mm |
| *perimeter&nbsp;thickness* | measured perimeter thickness (average of measured perimeters thickness if you measure more than one) | mm |

More information here: [Extrusion multiplier and filament diameter guide](https://guides.bear-lab.com/Guide/Extrusion+multiplier+and+filament+diameter/8?lang=e)



### Extruder steps/mm

![\textit{steps per mm}=\frac{\textit{motor steps} \cdot \mathit{\mu step} \cdot \textit{gear ratio}}{\textit{hobb dia} \cdot \pi}](img/formula_steps_per_mm_01.png)

Where:
| variable | description |  unit |
|:---------|:------------|:-----:|
| *steps&nbsp;per&nbsp;mm* | number of extruder steps for one full rotation | |
| *motor&nbsp;steps* | number of step for one full rotation of the motor. In general, 200 for 1.8° motor and 400 for 0.9° motor | |
| *&mu;step* | micro stepping configured in the 3D printer firmware (eg. 16, 32, 64...) | |
| *gear&nbsp;ratio* | gear ratio (eg. 3:1) | |
| *hobb&nbsp;dia* | effective hobb gear diameter | mm |

Example:

For an 1.8° stepper, 16 micro-stepping configuration, a gear ratio of 50:17 and Bondtech 1.75/5.0 drive gears:  
![\textit{steps per mm}=\frac{200 \cdot 16 \cdot ^{50}/_{17}}{7.22 \cdot \pi}=414.94 \Rightarrow 415](img/formula_steps_per_mm_example_01.png)



### Part Scaling

As the printed parts are printed warm and then cooldown to room temperature they will shrink in size. The shrinkage depends on the thermal expansion coefficient of the filament material used. Note that filament additives can change the thermal expansion factor of your material.


#### Slicer scaling factor

To calculate the scale percentage to use in your slicer to account for shrinkage.

![\textit{scale factor}=100(1+ \alpha \cdot \Delta_t)](img/formula_scale_factor_01.png)

Where:
| variable | description |  unit |
|:---------|:------------|:-----:|
| *scale&nbsp;factor* | percentage to scale your print part in your slicer | |
| *&alpha;* | filament material thermal expansion coefficient (see [Common thermal expansion coefficient](#common_thermal_expansion_coefficient) table bellow) | K<sup>-1</sup> |
| *&Delta;<sub>t</sub>* | difference between the bed temperature and the room temperature |  |

Example:

For a PETG part with a bed at 85°C and room temperature at 25°C:  
![\textit{scale factor}=100(1+60 \cdot 10^{-6} \cdot (85-25))=100.36%](img/formula_scale_factor_example_01.png)


#### Printed part size

To calculate a dimension after printing and cooldown.

![D_2=\frac{D_1}{1+ \alpha \cdot \Delta_t}](img/formula_part_size_01.png)

Where:
| variable | description |  unit |
|:---------|:------------|:-----:|
| *D<sub>1</sub>* | dimension in CAD or slicer (before printing) | mm |
| *D<sub>2</sub>* | dimension after printing and cooldown | mm |
| *&alpha;* | filament material thermal expansion coefficient (see [Common thermal expansion coefficient](#common_thermal_expansion_coefficient) table bellow) | K<sup>-1</sup> |
| *&Delta;<sub>t</sub>* | difference between the bed temperature and the room temperature |  |

Example:

For a PETG part with a width of 50mm,bed at 85°C and room temperature at 25°C:  
![D_2=\frac{50}{1+60\cdot10^{-6} \cdot (85-25)}=49.82mm](img/formula_part_size_example_01.png)


#### Common thermal expansion coefficients

| material | *&alpha;* |
|:---------|:----------|
| ABS  | 72 to 106 &middot; 10<sup>-6</sup> K<sup>-1</sup> |
| PETG | 51 to 68 &middot; 10<sup>-6</sup> K<sup>-1</sup> |
| PC   | 65 to 70 &middot; 10<sup>-6</sup> K<sup>-1</sup> |



### Pulley Diameters

Calculations for Gates 2GT and GT3 pulleys. More details here: [Timing Belt and Pulley](../mechanical/timing_belt_pulley.md)

![Belt and Pulley Glossary](img/belt_pulley_glossary_01.png)

![pd = \frac{P \cdot N}{\pi}](img/formula_pulled_pitch_dia_01.png)  
![od = pd - 2 \cdot U](img/formula_pulled_out_dia_01.png)

Where:
| variable | description |  unit |
|:---------|:------------|:-----:|
| pd   | pitch diameter | mm |
| P    | belt pitch | mm |
| N    | number of pulley teeth |  |
| od   | pulley outside diameter | mm |
| U    | Distance from pitch line to belt tooth bottom.<br />- U = 0.254mm for 2GT and GT2/3 2mm pitch belts<br />- U = 0.381mm for 3GT and GT2/3 3mm pitch belts | mm |

Example:

For a GT3 2mm pitch belt and 20T pulley:  
![pd = \frac{2 \cdot 20}{\pi} = 12.732mm](img/formula_pulled_pitch_dia_example_01.png)  
![od = 12.732 - 2 \cdot 0.254 = 12.224mm](img/formula_pulled_out_dia_example_01.png)


### Resources

Resources used for those calculations:

  * Monard, J.-A. (1994). *Tome IV Chaleur*. Centrale d'Achats de la Ville de Bienne
  * The formulas are generated by https://latex.codecogs.com/
  * Thermal expansion coefficients:
    * PETG: https://www.sd3d.com/wp-content/uploads/2017/06/MaterialTDS-PETG_01.pdf and https://devel.lulzbot.com/filament/Rigid_Ink/PETG%20DATA%20SHEET.pdf
    * ABS and PC: https://www.engineeringtoolbox.com/linear-expansion-coefficients-d_95.html
  * Belt and pulleys: https://www.sdp-si.com/PDFS/Technical-Section-Timing.pdf
