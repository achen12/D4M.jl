println("This is a test on the subreferencing of Associative Array")

A = ReadCSV("A.csv")

A1r = A["a,b,",:];               # Get rows a and b.
#TODO A2r = A("a *,",1:3)             # Get rows containing a and columns 1 thru 3.
#TODO A3r = A("a,:,b,",:)             # Get rows a to b.
#A4r = A(StartsWith("a,c,"),:)   # Get rows starting with a or c.
A1c = A[:,"a,b,"]               # Get cols a and b.
#TODO A2c = A(1:3,"a *,")             # Get rows 1 thru 3 and cols containing a.
#TODO A3c = A(:,"a,:,b,")             # Get cols a to b.
#TODO A4c = A(:,StartsWith("a,c,"))   # Get cols starting with a or b.
#TODO A1v = (A < "b,")                # Get all values less than b.

#print(A1v)
