# Project Files

A repository for code files related to my class project, implementing the paper:

Felipe Vico, Leslie Greengard, Miguel Ferrando. "Fast convolution with free-space Green's functions. *Journal of computational physics 323* (2016), 191-203.



The main tests performed in my paper are:

- `solve2DHelmholtzGaussian.m`, a script that solves the 2D Helmholtz equation for gaussian input.
- `solve2DPoissonGaussian.m`, a script that solves the 2D Poisson equation for gaussian input.
- `solve3DPoissonGaussian.m`, a script that solves the 3D Poisson equation for gaussian input.
- `solveDielectricDisk.m`, which solves a Lippmann-Schwinger integral equation for $q(x)$ a smoothly filtered dielectric disk.
- `solveLunebergLens.m`, which soves a Lippmann-Schwinger integral equation for $q(x)$ being the Luneberg lens.
- `testConvolution2D.m`, a script that compares `helperFunctions/convolution2D.m` to MATLAB's `conv2` function.
- `testconvolution3D.m`, a script that compares `helperFunctions/convolution3D.m` to MATLAB's `convn` functions.
- `solveWithReferenceSolution.m` replicates the experiment in `solve2DHelmholtzGaussian.m` but uses the Lippmann-Schwinger object from Dr. Zepeda-Núñez's "Lippmann_Schwinger" Github: https://github.com/Forgotten/Lippmann_Schwinger. 



Directories are organized as follows.

##### GreenFunctions

Contains functions that calculate $G_0^L$ and $G_k^L$ in two and three dimensions for appropriately sampled $s$ values.



##### helperFunctions

Contains general helper functions needed in other scripts. These include the core `convolution2D.m` and `convolution3D.m` functions, source functions for specific tests (Gaussian, smoothly filtered dielectric disk, Luneberg lens), solution functions for specific tests (for the 2D and 3D Helmholtz and Poisson equations), and miscelaneous functions (e.g., `maxError.m` which calculates the max error between a fine and coarse grid)



##### plots

Contains `plotLSExamples.m`, which is a script that plots the (hard-coded) results of `solveLunebergLens.m` and `solveDielectricDisk.m`.



##### other notes

If you wish to run `solve3DHelmholtzGaussian.m` (not presented in my paper) you will need to use the Faddeeva package as MATLAB's `erf` function expects real inputs. See:

Steven G. Johnson (2020). Faddeeva Package: complex error functions (https://www.mathworks.com/matlabcentral/fileexchange/38787-faddeeva-package-complex-error-functions), MATLAB Central File Exchange. Accessed December 11, 2020.