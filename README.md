# Julia-D4M
A Dynamic Distributed Dimensional Data Model(D4M) module for Julia.  D4M was developed in MATLAB by Dr Jeremy Kepner and his team at Lincoln Labs.
The goal is to implement D4M in a native Julia method.  As a course project in Numeric Computation with Julia, various parts of this implementation has been completed and compared with the original matlab in performance.  In the matrix performance example folder (testing performance in matrix like operations such as add and multiply), this implementation has achieved on par if not significant speed up (10x).  This is thanks to the effectiveness of Julia base in comparision to Matlab.

The D4M Project Page: http://www.mit.edu/~kepner/D4M/

Current Status: (v0.5) - End of course project
 * Read and Write CSV
 * Printtable tabular
 * Basic and advanced Assoc method of indexing
 * All methods of construction Assoc implemented
 * Implemented 1Intro/1AssocIntro and 3Scaling/3MatrixPerformance example folders and dependency.

Next Version: (v0.6) [Mid Feburary]
 * Implement 1Intro/2EdgeArt and 2Apps/1EntityAnalysis example folders and dependency.
 * Add interfaces to Julia's native DataFrame, allowing user to transfer data back and forth from JuliaStats

