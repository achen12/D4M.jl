function CatKeyMul(A::Assoc,B::Assoc)
    if isa(Col(A)[1],AbstractString) && isa(Row(B)[1],AbstractString)

        AB = logical(A)*logical(B);
        A1 = A[Row(AB),:];  B1 = B[:,Col(AB)];
        A2 = A1[:,Row(B1)]; B2 = B1[Col(A1),:];
        A2size = size(Adj(A2));  B2size = size(Adj(B2));

        A2adj = Adj(A2);
        A2col = Col(A2);

        B2adj = Adj(B2);
        
        rrr,ccc,~ = findnz(Adj(AB))
        v = Array{Array{Union{AbstractString,Number},1},1}()
        vvv = Array(Union{AbstractString,Number}, length(rrr))
        RowB = Row(B)
        for i = 1:B2size[2]
            potentialvv, ~, ~  = findnz(B2adj[:,i])
            X = A2adj[:,potentialvv] #reduce to just the potential for this column from B
            rr = X.rowval 
            vv = [ potentialvv[X[i,:]'.rowval] for i = rr] #Get the mapping from VV to column
            cc = repmat([i],length(rr),1)
            #=
            rrrr,vvvv,~ = findnz(A2adj[:,rrr])
            rrrri = sortperm(rrrr)
            rrrr = sort(rrrr);
            vv = rrr[vvvv[rrrri]]
            vv = RowB[vv]
            v = [v;vv]
            =#
        end
#=
        AB = A*B
#        A1 = A[Row(AB),:]
#        B1 = B[:,Col(AB)]
#        A  = A1[:,Row(B1)]
#        B  = B1[Col(A1),:]
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
            val = join(RowB[ABvalList],";")*";"
            ABVal[i] = val
        end
        AB.val = ABVal
        return AB=#
    else
        return A*B
    end
    

end
