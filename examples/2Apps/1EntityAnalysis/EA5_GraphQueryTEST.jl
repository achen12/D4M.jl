file_dir = Pkg.dir("D4M")*"/examples/2Apps/1EntityAnalysis/Entity.jld";

using JLD

E = load(file_dir)["E"]

E = logical(E);

A = sqIn(E);

d = diag(Adj(A))

A = putAdj(A,Adj(A)-diagm(d));


####

i,j,v = findnz(Adj(A));

An = putAdj(A, sparse(i,j,v ./ min(d[i],d[j])));

####

x = "LOCATION/new york,";

p = StartsWith("PERSON/,");

print( (A[p,x] > 4) & (An[p,x] > 0.3));

####

p0 = "PERSON/john kennedy,";

p1 = Row(A[p,p0] + A[p0,p]);

using PyPlot

spy(A[p1,p1])

p2 = Row( A[p1,p1] - (A[p,p0]+ A[p0,p]));

A[p2,p2] > 1
