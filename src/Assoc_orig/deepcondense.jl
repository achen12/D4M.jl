
#=
deepCondense : remove empty mapping of row, column, and value, and return the condensed of the input Assoc.
=#
function deepCondense(A::Assoc)
    Anew = condense(A)
    #if Assoc is already numeric, there isn't any reason to condense in val,
    #Because, the sparse matrix is keeping track of the values.
    if isempty(A.val)
        return Anew
    end
    #Below is for the case of nonnumeric Assoc 
    row,col,val = findnz(Anew.A)
    uniVal = sort(unique(val))
    val = Array{Int64,1}(map(x -> searchsortedfirst(uniVal,x), val))
    #At this point val is the mapping to uniVal
    Anew.A = sparse(row,col,val)

    uniVal = map(x -> Anew.val[x],uniVal)
    Anew.val = AssocEleArray(uniVal)
    return Anew
    
end


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

