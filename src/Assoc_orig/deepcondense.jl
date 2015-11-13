function deepCondense(A::Assoc)
    Anew = condense(A)

    row,col,val = findnz(A.A)
    uniVal = sort!(unique(val))
    valMap = [searchsortedfirst(x,uniVal) for x in A.val]
    val = map(x -> valMapp[x], val)
    Anew.A = sparse(row,col,val)
    Anew.val = uniVal
    return Anew
    
end
