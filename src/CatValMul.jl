function CatValMul(A::Assoc,B::Assoc)
    if isa(Val(A)[1],String) && isa(Val(B)[1],String)
        AB = sortedintersect(A.col,B.row)
        A = A[:,AB]
        B = B[AB,:]
        rrr,ccc,vvv = findnz(Adj(A*B))
        ABVal = Array(Union{AbstractString,Number},length(rrr))
        for i in 1:length(rrr)
            r = rrr[i]
            c = ccc[i]
            ABIntersect = sortedintersect(Col(A[r,:]),Row(B[:,c]))
            ABValList = Array{Union{AbstractString,Number},1}()
            print(ABIntersect)
            for x in ABIntersect
                print(x)
                push!(ABValList,Val(A[r,x*","])[1])
                push!(ABValList,Val(B[x*",",c])[1])
            end
            if length(ABValList) > 0
                val = join(ABValList,";")*";"
                ABVal[i] = val
            end
        end
        return Assoc(Row(A)[rrr],Col(B)[ccc],ABVal)
    else
        return A*B
    end
    

end
