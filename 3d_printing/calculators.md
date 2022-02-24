# 3D Printing Cheat Sheet

# Calculators


## Table of contents
* [&nldr;](../3d_printing/README.md)
* [Perimeters Width](#perimeters-width)
* [Extrusion Multiplier](#extrusion-multiplier)
* [Extruder steps/mm](#extruder-stepsmm)
* [Part Scaling](#part-scaling)
* [Pulley Diameters](#pulley-diameters)
* [Resources](#resources)


## Perimeters Width

In Slic3r and PrusaSlicer, the perimeters are overlapping each others while being printed (two perimeters of 0.45mm extrusion width will be 0.86mm and not 0.90mm). More information here: [Slic3r Flow Math][slic3r_flow_math] and [PrusaSlicer Layers and Perimeters][prusaslicer_layers_perimeters].

![\textit{extrusion spacing}=w-h(1-\frac{\pi}{4})](img/formula_extrusion_spacing_01.png)  
![\textit{perimeters width}=w+\textit{extrusion spacing} \cdot (N-1)](img/formula_perimeters_width_01.png)

Where:
| variable | description |  unit |
|:---------|:------------|:-----:|
| *w* | extrusion width (eg. 0.45mm) | mm |
| *h* | layer height (eg. 0.20mm) | mm |
| *N* | number of perimeters | |
| *extrusion spacing* | spacing between extrusions with overlapping | mm |
| *perimeters width* | width of perimeters as printed in Slic3r or PrusaSlicer | mm |



## Extrusion Multiplier

![\textit{extrusion multiplier}=\frac{\textit{original extrusion multiplier} \cdot \textit{extrusion width}}{\textit{perimeter thickness}}](img/formula_extrusion_multiplier_01.png)

Where:
| variable | description |  unit |
|:---------|:------------|:-----:|
| *extrusion&nbsp;multiplier* | extrusion multiplier adjusted | |
| *original&nbsp;extrusion&nbsp;multiplier* | original extrusion multiplier set in your slicer | |
| *extrusion&nbsp;width* | extrusion width set in your slice (0.45mm if you are using a 0.4mm nozzle and PrusaSlicer) | mm |
| *perimeter&nbsp;thickness* | measured perimeter thickness (average of measured perimeters thickness if you measure more than one) | mm |

More information here: [Extrusion multiplier calibration guide][extrusion_multiplier_calibration_guide]



## Extruder steps/mm

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



## Part Scaling

As the printed parts are printed warm and then cooldown to room temperature they will shrink in size. The shrinkage depends on the thermal expansion coefficient of the filament material used. Note that filament additives can change the thermal expansion factor of your material.


### Slicer scaling factor

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


### Printed part size

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


### Common thermal expansion coefficients

| material | *&alpha;* | source |
|:---------|:----------|:-------|
| ABS         | 72 to 110 &middot; 10<sup>-6</sup> K<sup>-1</sup> | [1][cte_abs01], [2][cte_common01], [3][cte_common02] |
| ASA         | 60 to 110 &middot; 10<sup>-6</sup> K<sup>-1</sup> | [1][cte_common02] |
| PC          | 65 to 70 &middot; 10<sup>-6</sup> K<sup>-1</sup> | [1][cte_pc01], [2][cte_common02] |
| PETG        | 51 to 68 &middot; 10<sup>-6</sup> K<sup>-1</sup> | [1][cte_petg01], [2][cte_petg02], [3][cte_petg03] |
| PLA (4043D) | 41 to 68 &middot; 10<sup>-6</sup> K<sup>-1</sup> | [1][cte_pla01], [2][cte_pla02], [3][cte_common02] |


## Pulley Diameters

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


## Resources

Resources used for those calculations:

  * Monard, J.-A. (1994). *Tome IV Chaleur*. Centrale d'Achats de la Ville de Bienne
  * Belt and pulleys: https://www.sdp-si.com/PDFS/Technical-Section-Timing.pdf
  * The formulas are generated by https://latex.codecogs.com/
  * [Slic3r Flow Math][slic3r_flow_math]
  * [PrusaSlicer Perimeters and Layers][prusaslicer_layers_perimeters]


[slic3r_flow_math]: https://manual.slic3r.org/advanced/flow-math
[prusaslicer_layers_perimeters]: https://help.prusa3d.com/en/article/layers-and-perimeters_1748

[extrusion_multiplier_calibration_guide]: https://guides.bear-lab.com/Guide/Extrusion+multiplier+and+filament+diameter/8?lang=e

[cte_abs01]: https://www.sd3d.com/portfolio/abs/
[cte_pc01]: https://xometry.eu/wp-content/uploads/2021/03/Polycarbonate.pdf
[cte_petg01]: https://www.sd3d.com/wp-content/uploads/2017/06/MaterialTDS-PETG_01.pdf
[cte_petg02]: https://devel.lulzbot.com/filament/Rigid_Ink/PETG%20DATA%20SHEET.pdf
[cte_petg03]: https://github.com/prusa3d/Original-Prusa-MINI/blob/master/DOCUMENTATION/PRINT%20SETTINGS/recommended%20print%20settings%20for%20Original%20Prusa%20MINI.md
[cte_pla01]: https://xometry.eu/wp-content/uploads/2021/03/PLA.pdf
[cte_pla02]: https://www.sd3d.com/wp-content/uploads/2017/06/MaterialTDS-PLA_01.pdf
[cte_common01]: https://www.engineeringtoolbox.com/linear-expansion-coefficients-d_95.html
[cte_common02]: https://www.cosineadditive.com/en/materials
