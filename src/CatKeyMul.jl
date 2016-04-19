function CatKeyMul(A::Assoc,B::Assoc)
    if isa(Col(A)[1],AbstractString) && isa(Row(B)[1],AbstractString)

##Target = Tousandth GFlops performance

    #=Approach #3 using the native BigInt to represent map indice sets.
    #Hundredth Thousandth GFlops performance back to optimizing approach #2
    #Scrapping the String aspect of the problem
    unionAColBRow = sortedunion(Col(A),Row(B));
    A = A[:,unionAColBRow] ; B = B[unionAColBRow,:]
    AdjA = Adj(A) ; AdjB = Adj(B);
    #Now the ACol and BRow is synced.
    AdjA = AdjA .!= 0
    rrr,ccc,~ = findnz(AdjB)
    rMax = AdjB.m
    @time vvv = map(r-> big(2)^(rMax-r),rrr)
    vvv = convert(Array{BigInt},vvv)
    #AdjB.nzval = vvv
    AdjB = sparse(rrr,ccc,vvv)  #This is now a BigInt-val Sparse Matrix
    @time AdjC = AdjA*AdjB  #Now Value of AdjC represents the set of Brow 
    rrr,ccc,vvv = findnz(AdjC)
    #Construct value mapping
    vKey = sort(unique(vvv))
    lvKey = length(vKey)
    @time vvv = map( v-> lvKey-searchsortedlast(vKey, v),vvv)
    @time vKey = map(v -> join(find(reverse(digits(v,2,rMax))),";")*";",vKey) #convert to array representation
#    vKey = map(v-> join(v,";")*";",vKey) #convert to string representatation
    @time vKey = convert(Array{Union{AbstractString,Number}},reverse(vKey))
    AB  = Assoc(Row(A),Col(B),vKey,sparse(rrr,ccc,vvv))
    =#

    # Approach #2 Ten-thousandth GFlops performance
    A = logical(A);
    B = logical(B);
          AB = A*B;

        #A1 = A[Row(AB),:];  B1 = B[:,Col(AB)];
        
        #A2 = A1[:,sortedintersect(Row(B1),Col(A1))]; B2 = B1[sortedintersect(Col(A1),Row(B1)),:];
        A2= A; B2 = B;
        A2size = size(Adj(A2));  B2size = size(Adj(B2));

        A2adj = Adj(A2);
        A2col = Col(A2);

        B2adj = Adj(B2);
        
#        v = Array{Array{Union{AbstractString,Number},1},1}()
#        vvv = Array(Union{AbstractString,Number}, length(rrr))
        vvv = Array{Union{AbstractString,Number},1}()
        RowB = Row(B)
        
        @time for i = 1:B2size[2]
            potentialvv = B2adj[:,i].rowval
            X = A2adj[:,potentialvv] #reduce to just the potential for this column from B
            vv = potentialvv[X'.rowval]  #Get the mapping from VV to column
            vvv = [vvv;vv]
        end
        
        @time rrr,ccc,v = findnz(Adj(AB))
        @time vvv = join(vvv,"; ") * "; "
        vind0 = find(vvv.data .== ' ')
        ABvCum = cumsum(v)
        vvv.data[vind0[ABvCum]] = ',';
        vvv = vvv[find(vvv.data .!= ' ')]

        vKey,~,vvv = StrUnique(vvv);

        AB.A = sparse(rrr,ccc,vvv)
        AB.val = vKey
        #TODO map vKey to RowB
        #
        
#        AB = A*B

#=  Approach #1 Ten-Thousandth GFlops performance
        A = logical(A)
        B = logical(B)
        AB = A*B
        A1 = A[Row(AB),:]
        B1 = B[:,Col(AB)]
        A  = A1[:,Row(B1)]
        B  = B1[Col(A1),:]
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
        =#
        return AB
    else
        return A*B
    end
    

end
