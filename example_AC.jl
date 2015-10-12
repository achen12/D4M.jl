#=Currently to test Assoc please use include()
=#
include("Assoc.jl");

A = Assoc("a,b,c,d","v,x,y,z,",[1,2,3,4])
dump(A)
#currently Dump works 
# Mixed type and non-empty strings works from Jake's Example
# So does the empty sets.

#=
ToDos
printtable - tabular form.  Q: Check matlab tabular form
writecsv and readcsv functions - utilize Julia csv functions.
Implement the indexing functions
=#

