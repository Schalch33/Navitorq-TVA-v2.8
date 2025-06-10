# Navitorq TVA - v2.8
Computer program for torsional vibration analysis

All input data of the equivalent elastic mass system must be defined in the Start.m file.
To solve the model, simply run the Start.m file.
Explanations of the output results can be found in Readme.pdf.

Considers:
- Viscous and/or rubber dampers
- Relative and absolute damping coefficients
- Loss factors can be defined for each connected inertia
- Interpolation of torsional damper characteristics for each engine speed step
- Analysis of branch systems
- Analysis of in-line and V-engine configurations
- 2D interpolation of cylinder pressure traces for each engine speed
- Instantaneous inertia for connecting rod + piston for each crankshaft angle
