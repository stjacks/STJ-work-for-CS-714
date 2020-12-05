# Homework 4

A list of the files in this directory as organized by problem statement.

### Problem A
 - `upwind.m` contains code that implements the upwind method for this problem.
 - `problemAVisualization.m` produces an animation of the upwind method as it evolves over time. Note: it does this within an infinite loop, so you will need to manually stop the animation when you are finished
 - `problemAVisualizeAtTime.m` plots the upwind method for varying number of grid points at "approximately" a certain time. Since each grid has a different $$\Delta t$$ I don't guarantee that every grid is plotted at the same time, but merely that every grid is plotted "close" to the specified time. 
 - `problemAVisualizeMultipleDt.m` plots the upwind method for a fixed grid size with varying values of $\Delta t$. Since each grid has a different $$\Delta t$$ I don't guarantee that every grid is plotted at the same time, but merely that every grid is plotted "close" to the specified time. 
 - `problemAErrorPlots.m` plots the absolute error of several coarse grids compared to a fine grid up to a specified time.
    - Uses `maxError.m` to calculate the max error between a fine and coarse vector

### Problem B
 - `godunov.m` contains code that implements Godunov's method for ths problem
     - Uses `flux.m` as the value of the flux function.
 - `problemBVisualization.m` is the counterpart of `problemAVisualization.m`. It animations the evolution of Godunov's method in an infinite loop.
 - `compareUpwindGodunov.m` visualizes both the Upwind and Godunov methods at a given time. Can be modified to either run in an infinite loop as an animation or plot results at a given time.
 - `problemBErrorPlots.m` plots the absolute error of several coarse grids compared to a fine grid up to a specified time
     - Uses `maxErrorG.m` to calculate the max error between a fine and coarse vector.
