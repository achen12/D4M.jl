load #TODO Load



sum(logical(col2type(E,"/")),1)  #TODO col2type

En = sum(logical(E),1)

~,entity,count = find(En)

An = Assoc(count,entity,1)

loglog(full(sum(Adj(An[:,StartsWith("LOCATION/,")]),2)) ,"o"); #TODO plot with loglog
