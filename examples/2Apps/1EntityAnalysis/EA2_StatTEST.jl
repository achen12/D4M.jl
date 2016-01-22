file_dir = Pkg.dir("D4M")*"/examples/2Apps/1EntityAnalysis/typeEntity.csv";

#E = ReadCSV(file_dir); #TODO save/load problem, Rapid load and reload in Julia?
sum(logical(col2type(E,"/")),1);

En = sum(logical(E),1);

~,entity,count = find(En);

An = Assoc(count,entity,1);

using PyPlot
loglog(full(sum(Adj(An[:,StartsWith("LOCATION/,")]),2)) ,"o"); 
