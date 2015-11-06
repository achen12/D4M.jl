E = ReadCSV("Edge.csv");                       # Read CSV file into associative array.

Ev = logical( E[:, r"V.*"] );        # Get vertices and convert to numbers.

Av = sqIn(Ev);                                 # Compute vertex adjacency graph.
print(Av);                               # Show in tabular form.

Ae = sqOut(Ev);                                # Compute edge adjacency graph.
print(Ae);                               # Show in tabular form.
