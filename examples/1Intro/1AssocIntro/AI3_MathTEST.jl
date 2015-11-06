#TODO add more annotation
println("This file demos some of the mathematical operations on Associative Array")

A = ReadCSV("A.csv")

A = logical(A)

print(A)

print(sum(A,1))

print(sum(A,2))



Aa = A[:,"a,"]

Ab = A[:,"b,"]

Aab = nocol(Aa) & nocol(Ab)





F =  ( Aab )' * A;

print(F)

Fn = F ./ sum(A,1)

print(Fn)





AtA = sqIn(A)

d = diag(adj(AtA))

AtA.A = AtA.A - sparse(diagm(d))

print(AtA)


