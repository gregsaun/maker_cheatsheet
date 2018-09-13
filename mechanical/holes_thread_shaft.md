# Mechanical Cheat Sheet

## Holes, Threads and Shaft

### Table of contents
* [Metric Threads](#metric-threads)
* [Clearance Drill](#clearance-drill)
* [Drill Speed](#drill-speed)
* [Shaft and Hole Tolerances](#shaft-and-hole-tolerances)
* [Sources](#sources)


### Metric Threads

| Screw Size (mm) | Thread Pitch (mm) | Drill Size (mm) |
|:---------------:|:-----------------:|:---------------:|
| M1.5 | 0.35 | 1.15 |
| M1.6 | 0.35 | 1.25 |
| M1.8 | 0.35 | 1.45 |
| M2   | 0.4  | 1.6 |
| M2.2 | 0.45 | 1.75 |
| M2.5 | 0.45 | 2.05 |
| M3   | 0.5  | 2.5 |
| M3.5 | 0.6  | 2.9 |
| M4   | 0.7  | 3.3 |
| M4.5 | 0.75 | 3.75 |
| M5   | 0.8  | 4.2 |
| M5.5 | 0.9  | 4.6 |
| M6   | 1    | 5 |
| M7   | 1    | 6 |
| M8   | 1.25 | 6.8 |
| M9   | 1.25 | 7.8 |
| M10  | 1.5  | 8.5 |
| M11  | 1.5  | 9.5 |
| M12  | 1.75 | 10.3 |
| M14  | 2    | 12.1 |
| M18  | 2.5  | 15.5 |
| M19  | 2.5  | 16.5 |
| M20  | 2.5  | 17.5 |


### Clearance Drill

| Screw Size (mm) | Close Fit Drill Size (mm) | Standard Fit Drill Size (mm) |
|:---------------:|:-------------------------:|:----------------------------:|
| M1.5 | 1.6   | 1.65 |
| M1.6 | 1.7   | 1.75 |
| M1.8 | 1.9   | 2.0  |
| M2   | 2.1   | 2.2  |
| M2.2 | 2.3   | 2.4  |
| M2.5 | 2.65  | 2.75 |
| M3   | 3.15  | 3.3  |
| M3.5 | 3.7   | 3.85 |
| M4   | 4.2   | 4.4  |
| M4.5 | 4.75  | 5    |
| M5   | 5.25  | 5.5  |
| M5.5 | 5.8   | 6.1  |
| M6   | 6.3   | 6.6  |
| M7   | 7.4   | 7.7  |
| M8   | 8.4   | 8.8  |
| M9   | 9.5   | 9.9  |
| M10  | 10.5  | 11   |
| M11  | 11.6  | 12.1 |
| M12  | 12.6  | 13.2 |
| M14  | 14.75 | 15.5 |
| M18  | 19    | 20   |
| M19  | 20    | 21   |
| M20  | 21    | 22   |


### Drill Speed


#### Drill speed per material

| Diameter (mm) | Softwood | Hardwood | Steel (tough) | Steel (mild) | Aluminum | Brass | Stainless Steel | Copper/Bronzes |
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| 1  | 20690 | 15916 | 4775 | 7958 | 23873 | 12732 | 7958 | 9549 |
| 2  | 10345 | 7958  | 2387 | 3979 | 11937 | 6366  | 3979 | 4775 |
| 3  | 6897  | 5305  | 1592 | 2653 | 7958  | 4244  | 2653 | 3183 |
| 4  | 5173  | 3979  | 1194 | 1989 | 5968  | 3183  | 1989 | 2387 |
| 5  | 4138  | 3183  | 955  | 1592 | 4775  | 2546  | 1592 | 1910 |
| 6  | 3448  | 2653  | 796  | 1326 | 3979  | 2122  | 1326 | 1592 |
| 7  | 2956  | 2274  | 682  | 1137 | 3410  | 1819  | 1137 | 1364 |
| 8  | 2586  | 1989  | 597  | 995  | 2984  | 1592  | 995  | 1194 |
| 9  | 2299  | 1768  | 531  | 884  | 2653  | 1415  | 884  | 1061 |
| 10 | 2069  | 1592  | 477  | 796  | 2387  | 1273  | 796  | 955 |
| 12 | 1724  | 1326  | 398  | 663  | 1989  | 1061  | 663  | 796 |
| 14 | 1478  | 1137  | 341  | 568  | 1705  | 909   | 568  | 682 |
| 18 | 1149  | 884   | 265  | 442  | 1326  | 707   | 442  | 531 |
| 20 | 1035  | 796   | 239  | 398  | 1194  | 637   | 398  | 477 |

unit : rotation/min


#### Common Cutting Speed

| Material | Cutting speed (m/min)
|:--:|:--:|
| Softwood | 65 |
| Hardwood | 50 |
| Steel (tough) | 15 |
| Steel (mild) | 25 |
| Aluminum | 75 |
| Brass | 40 |
| Stainless Steel | 25 |
| Copper/Bronzes | 30 |


#### Formula
n = 1000 * Vc / ( pi * d )

Where:\
n = Rotational Speed of the Main Spindle (rotation/min)\
Vc = Cutting speed, depends on material, see table bellow (m/min)\
d = drill diameter (mm)\


### Shaft and Hole Tolerances

Table of ISO tolerances of most common classes for 6 to 10mm shafts/holes

| Hole class |  Hole<br> min / max | Shaft<br> min / max | Shaft class |
|:-----:|:---:|:---:|:---:|
| F7 |  0.0130 / 0.0280 | -0.0280 / -0.0130 | f7 |
| F6 |  0.0130 / 0.0220 | -0.0220 / -0.0130 | f6 |
| G7 |  0.0050 / 0.0200 | -0.0200 / -0.0050 | g7 |
| G6 |  0.0050 / 0.0140 | -0.0140 / -0.0050 | g6 |
| H7 |  0.0000 / 0.0150 | -0.0150 /  0.0000 | h7 |
| H6 |  0.0000 / 0.0090 | -0.0090 /  0.0000 | h6 |
| H5 |  0.0000 / 0.0060 | -0.0060 /  0.0000 | h5 |

More here : http://theoreticalmachinist.com/IsoTolZoneCalc


### Sources

* [Metric Tap & Clearance Drill Sizes](https://littlemachineshop.com/reference/TapDrillSizes.pdf)
* [Le B.A.-BA à l’atelier - EPFL](https://sti-ateliers.epfl.ch/files/content/sites/sti-ateliers/files/atmx/documents/LeB.A-BAatelier.pdf)
* [MacMaster-Carr](https://www.mcmaster.com)
* Tolerances and fits : http://theoreticalmachinist.com/IsoTolZoneCalc and http://www.amesweb.info/FitTolerance/FitTolerance.aspx