function CatKeyMul(A::Assoc,B::Assoc)
    if isa(Col(A)[1],AbstractString) && isa(Row(B)[1],AbstractString)
        A = logical(A);
        B = logical(B);
        AB = A*B;
        A1 = A[Row(AB),:];  B1 = B[:,Col(AB)];
        ABintersect = sortedintersect(Row(B1),Col(A1))
        A2 = A1[:,ABintersect]; B2 = B1[ABintersect,:];
        A2size = size(Adj(A2));  B2size = size(Adj(B2));

        A2adj = Adj(A2);
        A2col = Col(A2);

        B2adj = Adj(B2);
        A1 = 0
        A2 = 0
        B1 = 0
        B2 = 0
        rrr,ccc,v = findnz(Adj(AB))
        vvv = Array{Union{AbstractString,Number},1}()
        RowB = Row(B)
        indexvvv = 1; 
        for i = 1:B2size[2]
            potentialvv = find(B2adj[:,i]);
            rrrr,vvvv = findn(A2adj[:,potentialvv]);
            vvvv = getindex(vvvv,sortperm(rrrr,alg=QuickSort));
            vv = potentialvv[vvvv];
            append!(vvv,vv);
        end
        A2adj = 0
        B2adj = 0

        vvv = join(vvv,"; ") *"; "
        vind0 = find(vvv.data .== ' ')
        cumsum!(v,v)
        vvv.data[vind0[v]] = ',';
        vvv = vvv[find(vvv.data .!= ' ')]

        vKey,~,vvv = StrUnique(vvv);

        AB.A = sparse(rrr,ccc,vvv)
        AB.val = map(keyset -> join(map(key -> RowB[parse(Int,key)] , split(keyset,";")[1:end-1]) ,";")*";" ,vKey)
         
        return AB
    else
        return A*B
    end
    

end
