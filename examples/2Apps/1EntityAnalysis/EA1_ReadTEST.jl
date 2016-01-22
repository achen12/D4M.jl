
file_dir = Pkg.dir("D4M")*"/examples/2Apps/1EntityAnalysis/Entity.csv";
E = ReadCSV(file_dir);
print(E[1:5,:]);

~,~,doc_val      = find(E[:,"doc,"]);
~,~,entity_val   = find(E[:,"entity,"]);
~,~,position_val = find(E[:,"position,"]);
~,~,type_val     = find(E[:,"type,"]);

typeEntity_val = CatStr(type_val, "/" , entity_val); 

E = Assoc(doc_val,typeEntity_val,position_val);

WriteCSV(E,Pkg.dir("D4M")*"/examples/2Apps/1EntityAnalysis/typeEntity.csv");


print(E[1,:]);


using PyPlot 
spy(E');
