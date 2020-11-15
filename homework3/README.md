# Homework 3

A list of the files in this directory as organized by problem statement.



### General functions

- `firstStep.m` calculates the first step according to Problem C.b and respecting boundary conditions
- `step.m` calculates the next step according to Problem C.a and respecting boundary conditions
- `Laplacian.m` calculates the Laplacian of a 2D matrix input. On input $u$ it returns $u_{xx}+u_{yy}$
  - `testLaplacian.m` tests a few easy functions to make sure the Laplacian is as expected, up to numerical error.
- `chebfft.m` is the FFT version of $D_n$ and calculates the derivative of the input vector. It is based on Trefethen's function of the same name.
  - `testChebFFT.m` tests a few easy functions to make sure the derivative is as expected, up to numerical error. It is not a fully-formed test script, but instead was used as scratch work for troubleshooting errors in the Laplacian.

### Problem C.c
 - `ProblemCc.m` is a script that solves Problem C.c. In addition to the general functions, it also utilizes
   - `Fx.m` is the function f(x) defined in the problem statement (used for initial conditions)
   - `maxError.m` calculates the absolute error between two matrices, assuming the dimensions of one are a multiple of the other.
- `ProblemCcplot.m` is a script that produces the required plots for Problem C.c.

### Problem C.e
 - `ProblemCe.m` is a script that solves Problem C.e. In addition to the general functions, it also utilizes
    - `wave_solution.m`, a modified version of the function of the same name provided as a solution to Problem 2 (i.e., implements the finite difference method from Homework 2).
       - `Ah.m` is required and is copied directly from the class Github.
    - `spectralWave` calculates the spectral solution at a given time $T$, using the same techniques used in C.c.
