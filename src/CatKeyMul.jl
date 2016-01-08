function CatKeyMul(A::Assoc,B::Assoc)
    if isa(Col(A)[1],String) && isa(Row(B)[1],String)
        AB = sortedintersect(A.col,B.row)
        A = A[:,AB]
        B = B[AB,:]
        rrr,ccc,vvv = findnz(Adj(A*B))
        ABVal = Array(Union{AbstractString,Number},length(rrr))
        for i in 1:length(rrr)
            r = rrr[i]
            c = ccc[i]
            ABvalList = sortedintersect(Col(A[r,:]),Row(B[:,c]))
            if length(ABvalList) > 0
                val = join(ABvalList,";")*";"
                ABVal[i] = val
            end
        end
        return Assoc(Row(A)[rrr],Col(B)[ccc],ABVal)
    else
        return A*B
    end
    

end
