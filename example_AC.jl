#=Currently to test Assoc please use include()
=#
include("Assoc_matlab.jl");

A = Assoc("a|b|c|d|","v,x,y,z,",[1,2,3,4])
dump(A)
b = A["a,b","x,v"]
#currently Dump works 

#=
ToDos
printtable - tabular form.  Q: Check matlab tabular form
writecsv and readcsv functions - utilize Julia csv functions.
=#

