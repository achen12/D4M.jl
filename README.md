# julia-d4m
A D4M module for Julia.  D4M was developed in MATLAB by Dr Jeremy Kepner and his team at Lincoln Labs.
As the development goes, a few possible implementations of D4M will be explored.
 * The first implementation will be an implementation that is nearly 1:1 with the matlab implementation.  This is filed as Assoc\_matlab 
 * The second is a parametric implementation.  Generalizing the accept type for row, column, and value, this type will allow user to definte their type and operations.  This is filed as Assoc\_para

The D4M Project Page: http://www.mit.edu/~kepner/D4M/

Current Status:
 * Testing out Parametric implementation of Assoc
 * writecsv and readcsv into D4M implementing
 * Assoc Correlation implementing
 * printtable tabular form output implementing

Past Status
 * Assoc\_matlab :norow,nocol, and sum implemented
 * Assoc\_matlab :Basic Assoc indexing
 * StrUnique implemented, ForwardMapping not implemented, not optimized.
 * Assoc\_matlab overloaded Constructor of multitype Assoc implemented
 * Assoc Type internal type and constructor defined.

