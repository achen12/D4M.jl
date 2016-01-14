function col2type(A,splitSep)

    r,c,v = find(A);
    cType, cVal = SplitStr(c,splitSep);
    return Assoc(r,Array{Union{AbstractString,Number}}(cType),Array{Union{AbstractString,Number}}(cVal));

end
