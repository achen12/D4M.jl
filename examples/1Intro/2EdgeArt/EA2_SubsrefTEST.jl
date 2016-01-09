csv_dir = Pkg.dir("D4M") * "/examples/1Intro/2EdgeArt/Edge.csv"
print(csv_dir)

E = ReadCSV(csv_dir);                       # Read CSV file into associative array.
print(E);                                # Show in tabular form.

Eo = E[(E[:,"Color,"] == "Orange" ).row,:];   # Get orange edges.
print(Eo);                               # Show in tabular form.

Eog = E[ StartWith("O,G,") ,:];               # Get orange and green edges.
print(Eog);
