# String  vectors *must* be ROW vectors!!!
iStr =  "01,02,03,04,21,22,23,24,41,51,61,62,63,64,"; 

# Numeric vectors *must* be COLUMN vectors!!! 
iNum =  [ 1  1  1  1  4  3  2  1 4  5  6  6  6  6 ]';

# Mixed type empty arrays.
A00 = Assoc("","","");           # All empty.
A01 = Assoc("",iStr,iNum);       # Empty row.
A02 = Assoc(iNum,iStr,"");       # Empty value.
A03 = Assoc(iNum,[],"");         # Empty column and value.
A04 = Assoc("",[],[]);           # All empty.
A05 = Assoc("","",[]);           # All empty.
A06 = Assoc("",iNum,[]);         # Row and value empty.

# Mixed type non-empty arrays.
A11 = Assoc("a,",iStr,iNum);     # String scalar,  string vector,  numeric vector.
A12 = Assoc(iNum,iStr,"a,");     # Numeric vector, string vector,  string scalar.
A13 = Assoc(iNum,1,"a,");        # Numeric vector, numeric scalar, string scalar.
A14 = Assoc("a,",1,1);           # String scalar,  numeric scalar, numeric scalar.
A15 = Assoc("a,","a,",1);        # String scalar,  string scalar,  numeric vector.
A16 = Assoc("a,",iNum,1);        # String scalar,  numeric vector, numeric scalar.

