file_dir = Pkg.dir("D4M")*"/examples/2Apps/1EntityAnalysis/Entity.jld";

using JLD

E = load(file_dir)["E"]

E = logical(E)

x = "LOCATION/new york,";
p = "PERSON/michael chang,";
F = ( nocol(E[:,x]) & nocol(E[:,p]))' * E;
print(F' > 1 )

Fn = F./ sum(E,1)
print((Fn' > 0.02))

