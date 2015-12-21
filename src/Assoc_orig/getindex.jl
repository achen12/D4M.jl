# This is the getindex function for Assoc, the Associate Array.
import Base.getindex
StringOrNumArray  = Union{AbstractString,Array,Number}

#The Base getindex function which most higher level function would call upon.
function getindex(A::Assoc, i::Array{Int64}, j::Array{Int64})
    #Check if A is empty
    if nnz(A.A) == 0
    return Assoc([1],[1],0,(+))
    end

    return deepCondense(Assoc(A.row[i],A.col[j],A.val,A.A[i,j]))
    end

#Singular Case
getindex(A::Assoc,i::Any)                  = getindex(A,i,:)

PreviousTypes = Array{Int64}



#Variations by derivations
#Each of the additional type would call upon the base functions above.
#It does so by building up row and column combinations of the new type with all previous types.

#Get index with basic addressing.
#Variations between Element, Array, Colon, Range
getindex(A::Assoc,i::Array{Union{AbstractString,Number}},j::PreviousTypes)                                       = getindex(A,find(x-> x in i,A.row),j)
getindex(A::Assoc,i::PreviousTypes,j::Array{Union{AbstractString,Number}})                                       = getindex(A,i,find(x-> x in j,A.col))
getindex(A::Assoc,i::Array{Union{AbstractString,Number}},j::Array{Union{AbstractString,Number}})                 = getindex(A,find(x-> x in i,A.row),find(x-> x in j,A.col))

PreviousTypes = Union{PreviousTypes,Array{Union{AbstractString,Number}}}

getindex(A::Assoc,i::Int64,j::PreviousTypes)         = getindex(A,[i],j)
getindex(A::Assoc,i::PreviousTypes,j::Int64)         = getindex(A,i,[j])
getindex(A::Assoc,i::Int64,j::Int64)                 = getindex(A,[i],[j])

PreviousTypes = Union{PreviousTypes,Int64}

getindex(A::Assoc,i::Colon,j::PreviousTypes)         = getindex(A,1:size(A.row,1),j)
getindex(A::Assoc,i::PreviousTypes,j::Colon)         = getindex(A,i,1:size(A.col,1))
getindex(A::Assoc,i::Colon,j::Colon)                 = getindex(A,1:size(A.row,1),1:size(A.col,1))

PreviousTypes = Union{PreviousTypes,Colon}

getindex(A::Assoc,i::Range,j::PreviousTypes)         = getindex(A,collect(i),j)
getindex(A::Assoc,i::PreviousTypes,j::Range)         = getindex(A,i,collect(j))
getindex(A::Assoc,i::Range,j::Range)                 = getindex(A,collect(i),collect(j))

PreviousTypes = Union{PreviousTypes,Range}



#Variations of Single Sequence Strings that is separated by a single character separator.
getindex(A::Assoc, i::AbstractString, j::PreviousTypes)   = getindex(A, find( x -> in(x,StrUnique(i)[1]),A.row), j)
getindex(A::Assoc, i::PreviousTypes ,j::AbstractString)   = getindex(A, i ,find( x -> in(x,StrUnique(j)[1]),A.col))
getindex(A::Assoc, i::AbstractString ,j::AbstractString)  = getindex(A, find( x -> in(x,StrUnique(i)[1]),A.row) ,find( x -> in(x,StrUnique(j)[1]),A.col))

PreviousTypes = Union{PreviousTypes,AbstractString}


#Variations by Regex
getindex(A::Assoc, i::Regex, j::PreviousTypes)  = getindex(A, find( x -> ismatch(i,x),A.row), j)
getindex(A::Assoc, i::PreviousTypes, j::Regex)  = getindex(A, i, find( x -> ismatch(j,x),A.col))
getindex(A::Assoc, i::Regex, j::Regex)          = getindex(A, find( x -> ismatch(i,x),A.row), find( x -> ismatch(j,x),A.col)


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################
)
