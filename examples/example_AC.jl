#=Currently to test Assoc please use include()
=#
include("../src/D4M.jl");

A = Assoc("a|b|c|d|","v,x,y,z,",[1,2,3,4]);
a = A["a,b,","x,v,"];
B = Assoc("v,x,y,z,","a+b+c+d+",[5,6,7,8]);
#currently Dump works 

#=
ToDos
writecsv and readcsv functions - utilize Julia csv functions.
=#
println("Constructing histogram of A on column x and z..");
C = transpose( nocol(A[:,"v,"]) & nocol(A[:,"z,"])) *A;
print(C);

