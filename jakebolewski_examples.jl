#==========================================#
# Associative array construction and display.
#==========================================#
using D4M

# Create comma separated lists of row keys, column keys and values.
# Note: last entry in each list is the delimiter.
const r = "a,a,a,a,a,a,a,aa,aaa,b,bb,bbb,a,aa,aaa,b,bb,bbb,"
const c = "a,aa,aaa,b,bb,bbb,a,a,a,a,a,a,a,aa,aaa,b,bb,bbb,"
const v = "a-a,a-aa,a-aaa,a-b,a-bb,a-bbb,a-a,aa-a,aaa-a,b-a,bb-a,bbb-a,a-a,aa-aa,aaa-aaa,b-b,bb-bb,bbb-bbb,"

# Create assoc array and list triples.
A = Assoc(r,c,v)

# Show data structure.
dump(A);

# Display in tabular form.
printtable(A);

# Write to a CSV file.
D4M.writecsv(open("A.csv","w"), A) # or

# which is a wrapper around
open("A.csv","w") do io
    D4M.write(io, MIME"text/csv", A)
end

open("A.csv","w") do io
    D4M.write(io, MIME"text/tab-separated-values", A)
end


#==================================================#
# Show different ways to index an associative array.
#==================================================#

A = D4M.readcsv(open("A.csv", "r"))

A1r = A["a,b,",:]               # Get rows a and b.
A2r = A['a *,',1:3]             # Get rows containing a and columns 1 thru 3.
A3r = A['a,:,b,',:]             # Get rows a to b.
A4r = A[startswith"a,c,",:]     # Get rows starting with a or c.
A1c = A[:,"a,b,"]               # Get cols a and b.
A2c = A[1:3,"a *,"]             # Get rows 1 thru 3 and cols containing a.
A3c = A[:,"a,:,b,"]             # Get cols a to b.
A4c = A[:,startswith"a,c,"]     # Get cols starting with a or b.
A1v = A .< "b,"                 # Get all values less than b.

#=======================#
# Simple Math Example
#=======================#
A = D4M.readcsv("A.csv")    # Read CSV file into associative array.
A = float64(bool(A))        # Convert to numeric. Short for double(logical()).

# Show in tabular form
printtable(A);

show(sum(A,1))         # Sum into row vector.
printtable(sum(A,2))   # Sum into column vector.

# Compute a simple join.
Aa = A[:,"a,"];                  # Get column a.
Ab = A[:,"b,"];                  # Get column b.
Aab = nocol(Aa) && nocol(Ab)     # Find both a and b.

# Dataframes.jl supports complex joins, it would be nice to leverage this
# Aab = D4M.join(Aa, Ab)

#=============================================#
# Compute histogram (facets) of other columns
# that are in rows with both a and b.
#=============================================#
F = transpose( nocol(A[:,"a,"]) && nocol(A[:,"b,"]) ) * A
printtable(F.')     # Show in tabular form.

Fn = F ./ sum(A,1)  # Normalized facets.
printtable(Fn.')    # Show in tabular form.

#=============================================#
# Compute correlation.
#=============================================#
AtA = A'*A                          # this form gets special cased in julia to be fast
d = diag(adj(AtA))                  # Get diagonal of adjacency matrix.
AtA = adj(AtA) - diag(d)
setadj!(AtA, adj(AtA) - diag(d));   # Subtract diagonal, works on square matrix.
printtable(AtA)                     #  Show in tabular form.

#==================================================#
# Mixed string and numeric associative arrays.
#==================================================#

# String vectors must be row vectors
istr = "01,02,03,04,21,22,23,24,41,51,61,62,63,64,"

# Numeric vectors must be Column vectors
inum = [1,1,1,1,4,3,2,1,4,5,6,6,6,6]

A00 = Assoc("", "","")            # All empty
A01 = Assoc("", istr, inum)       # Empty row
A02 = Assoc(inum, istr, "")       # Empty value
A03 = Assoc(inum, [], "")         # Empty column and value
A04 = Assoc("", inum, [])         # Empty column and value
A05 = Assoc('','',[]);            # All empty.
A06 = Assoc('',iNum,[]);          # Row and value empty.

# Mixed type and non-empty strings
A = Assoc("a,", istr, inum)
A = Assoc(inum, istr, "a,")
A = Assoc(inum, 1, "a,")
A = Assoc("a,", 1, 1)
A = Assoc("a,", "a,", 1)
A = Assoc("a,", "a,", inum)
A = Assoc("a,", inum, 1)
