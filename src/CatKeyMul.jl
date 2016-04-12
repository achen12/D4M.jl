function CatKeyMul(A::Assoc,B::Assoc)
    if isa(Col(A)[1],AbstractString) && isa(Row(B)[1],AbstractString)
        AB = sortedintersect(Col(A),Row(B))
        A = A[:,AB]
        B = B[AB,:]
        AB = A*B
        rrr,ccc,~ = findnz(Adj(AB))
        ABVal = Array(Union{AbstractString,Number},length(rrr))
        AA = Adj(A)
        BA = Adj(B)
        RowA2Cols = [ AA[i,:]'.rowval for i = 1:AA.m]
        RowB = Row(B)
        RowA = Row(A)
        ColB = Col(B)
        c = 1
        ColB2Rows =  BA[:,c].rowval
        for i in 1:length(rrr)
            r = rrr[i]
            if(c != ccc[i])
                c = ccc[i]
                ColB2Rows =  BA[:,c].rowval
            end
            ABvalList = sortedintersect(RowA2Cols[r],ColB2Rows)
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
