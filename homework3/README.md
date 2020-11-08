# Homework 3

Unfinished README

A list of the files in this directory as organized by problem statement.

### Problem b
 - `ProblemB.m` is a script that solves Problem B. It utilizes the following files
   - `Fx.m` is the function f(x) defined in the problem statement
   - `FPrimex.m` is the function f'(x) (the derivative of f(x))

### Problem Ca
 - `ProblemCa.m` is a script that solves Problem Ca as described in my writeup. It prints the vector of errors but does **not** plot them. It relies on the following functions
   - `Fx.m` is the function f(x) defined in the problem statement
   - `firstStep.m` takes a delta x and delta t and returns the matrix corresponding to the first step of the two-step method detailed in my writeup.
   - `multiStep.m` takes the current matrix, the previous matrix, delta x, and delta t, and returns the matrix corresponding to one time step in the future. This is the '2nd' step of our multistep method.
   - `maxError.m` calculates the absolute error between two matrices. It assumes one matrix (grid) is larger but contains all of the points of the smaller matrix (grid). It finds the points of the smaller grid in the larger, then computes the absolute error and returns the maximum.
 - `ProblemCaPlot.m` is a script that creates the log-log plot asked for. It contains a hard-coded error vector that is the result printed by `ProblemCa.m`
 
### ProblemCb
 - `ProblemCb.m` is a script that samples a fine grid and plots points where the roots rho (found in my writeup) have absolute value <= 1
