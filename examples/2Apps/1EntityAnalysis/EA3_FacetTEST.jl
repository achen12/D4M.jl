
E = logical(E)

x = "LOCATION/new york,";
p = "PERSON/michael chang,";
F = ( nocol(E[:,x]) & nocol(E[:,p]))' * E;
print(F' > 1 )

Fn = F./ sum(E,1)
print((Fn' > 0.02))

