##Testing the Generation of Kronecker Graph
include("KronGraph500NoPerm.jl")

SCALE = 12
EdgesPerVertex = 16
Nmax = 2.^SCALE
M = EdgesPerVertex .* Nmax

v1,v2 = KronGraph500NoPerm(SCALE,EdgesPerVertex)
A = sparse(v1,v2,1)

#There is a spy in PyPlot
#=
using PyPlot

figure
spy(A)
xlabel("end vertex")
ylabel("start vertex")

figure
loglog(full(OutDegree(A)),'o')
xlabel("degree")
ylabel("count")

spy(A)



=#
