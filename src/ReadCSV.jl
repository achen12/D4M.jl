function ReadCSV(fname)
    inDim = readdlm(fname,',')
    (rowN,colN) = size(inDim)
    row = [];
    col = [];
    val = [];
    if colN >2
        for x = 2:colN
            for y = 2:rowN
                push!(row, inDim[y,1])
                push!(col, inDim[1,x])
                push!(val, inDim[y,x])
            end
        end
        return Assoc(row,col,val,(+))
    else #2D associative?
    #Currently Ignoring
        return
    end
end
