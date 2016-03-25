file_dir = Pkg.dir("D4M")*"/examples/2Apps/1EntityAnalysis/Entity.jld";

using JLD

E = load(file_dir)["E"]


Es = E;
E = logical(E);

Ae = sqIn(E);
Ae
using PyPlot
figure;
spy(Ae);


