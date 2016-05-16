function CatValMul(A::Assoc,B::Assoc)
    if isa(Val(A)[1],AbstractString) && isa(Val(B)[1],AbstractString)
        AB = A*B;
        A1 = A[Row(AB),:];  B1 = B[:,Col(AB)];
        ABintersect = sortedintersect(Row(B1),Col(A1))
        A2 = A1[:,ABintersect]; B2 = B1[ABintersect,:];
        A2size = size(Adj(A2));  B2size = size(Adj(B2));

        A2adj = Adj(A2);
        A2col = Col(A2);

        B2adj = Adj(B2);
        A2val = Val(A2);
        B2val = Val(B2);
        A1 = 0
        A2 = 0
        B1 = 0
        B2 = 0
        A2v = Array{Union{AbstractString,Number},1}();
        B2v = Array{Union{AbstractString,Number},1}();
        for i = 1:B2size[2]
            B2rrr, B2ccc, B2vvv = findnz(B2adj[:,i]);
            A2rrrr, A2cccc, A2vvvv = findnz(A2adj[:,B2rrr]);
            A2rrrri = sortperm(A2rrrr);
            B2vv = B2vvv[A2cccc[A2rrrri]];
            A2vv = A2vvvv[A2rrrri]
            append!(B2v,B2vv);
            append!(A2v,A2vv);
        end
        A2adj = 0
        B2adj = 0
        
        ABr,ABc,ABv = findnz(Adj(AB));
        A2val = Array{AbstractString,1}(map(string,A2val))
        B2val = Array{AbstractString,1}(map(string,B2val))

        v = CatStr(A2val[A2v], ":", B2val[B2v]);
        cumsum!(ABv,ABv);

        vvv = join(v,"; ") *"; "
        vind0 = find(vvv.data .== ' ')
        vvv.data[vind0[ABv]] = ',';
        vvv = vvv[find(vvv.data .!= ' ')]

        vKey,~,vvv = StrUnique(vvv);

        AB.A = sparse(ABr,ABc,vvv)
        AB.val = vKey 
        return AB
    else
        return A*B
    end
    

end
