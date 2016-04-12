function CatKeyMul(A::Assoc,B::Assoc)
    if isa(Col(A)[1],AbstractString) && isa(Row(B)[1],AbstractString)
        AB = sortedintersect(Col(A),Row(B))
        A = A[:,AB]
        B = B[AB,:]
        AB = A*B
        ABVal = Array(Union{AbstractString,Number},length(rrr))
        AA = Adj(A)
        BA = Adj(B)
        RowA2Cols = [ AA[i,:]'.rowval for i = 1:AA.m]
        RowB = Row(B)
        RowA = Row(A)
        ColB = Col(B)
        ColB2Rows = [ BA[:,i].rowval for i = 1:BA.n]
        for i in 1:length(rrr)
            r = rrr[i]
            c = ccc[i]
            ABvalList = sortedintersect(RowA2Cols[r],ColB2Rows[c])
            if length(ABvalList) > 0
                val = join(RowB[ABvalList],";")*";"
                ABVal[i] = val
            end
        end
        AB.val = ABVal
        return AB
    else
        return A*B
    end
    

end
