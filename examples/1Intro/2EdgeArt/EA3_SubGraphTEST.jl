csv_dir = Pkg.dir("D4M") * "/examples/1Intro/2EdgeArt/Edge.csv"
print(csv_dir)

E = ReadCSV(csv_dir);                       # Read CSV file into associative array.
Ev = logical( E(:, StartsWith("V,")) );        # Get vertices and convert to numbers.

EvO = Ev[StartsWith("O,"),:];                  # Get orange edges.
EvG = Ev[StartsWith("G,"),:];                  # Get green edges.

AvOG = transpose(EvO) * EvG;                   # Compute vertex adjacency graph.
       print(AvOG);                             # Show empty structure.

       AeOG = EvO * transpose(EvG);                   # Compute edge adjacency graph.
       print(AeOG);                             # Show in tabular form.

       AeOG = CatKeyMul(EvO,transpose(EvG));          # Compute edge adjacency graph preserving pedigree.
       print(AeOG); 
