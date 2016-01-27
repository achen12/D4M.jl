file_dir = Pkg.dir("D4M")*"/examples/2Apps/1EntityAnalysis/Entity.jld";

using JLD

E = load(file_dir)["E"]

E = logical(E);

A = sqIn(E);

d = diag(Adj(A))

A = putAdj
