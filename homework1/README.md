# In this directory
can be found:
##### Problem description:
 - `homework.pdf` contains the assigned questions
 
##### Assignment solutions
 - `Question_c.m`  contains code that answers question C.b.
 
##### Helper functions
 - `GaussSeidel.m` contains the code to run Gauss-Seidel on the input matrix to solve Problem C.b. It currently doesn't converge to the solution to Problem C.b for reasons unknown.
 - 'GaussSeidelErr.m' runs Gauss-Seidel until the error is < epsilon. Since it doesn't converge to the solution given, I wouldn't recommend actually running the code.
 - `setup.m` creates a matrix of a given size for use in solving Problem C.b
 - `setup_g.m` creates a matrix of a given size for use in solving Problem C.g
 - `maxError.m` calculates the max error of two matrices.
 - `exact.m` calculates the exact solution according to Piazza post 23
 - `maxExactError.m` calculates the max error of the input matrix as compared to the exact solution.
 - `profSolver` runs Gauss-Seidel on the matrix form of the problem, as recommended in Piazza post 27. Convergence fails here as well.

All helper functions contain function header comments
