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
getindex(A::Assoc, i::Regex, j::Regex)          = getindex(A, find( x -> ismatch(i,x),A.row), find( x -> ismatch(j,x),A.col))


PreviousTypes = Union{PreviousTypes,Regex}


#Variation with StartsWith
type StartsWith
    inputString::AbstractString
end

function StartsWithHelper(Ar::Array{Union{AbstractString,Number}},S::StartsWith)
    str_list = []
    if S.inputString[end] == ','
        str_list,~ = StrUnique(S.inputString)
    else
        str_list = [S.inputString]
    end
    result_indice = Array{Int64,1}()
    for str in str_list
        str_result_first = searchsortedfirst(Ar,str)
        str_result_last = searchsortedlast(Ar,str*string(Char(255)))
        if str_result_first <= str_result_last
            [push!(result_indice,x) for x in str_result_first:str_result_last]
        end
    end
    return result_indice
end

getindex(A::Assoc,i::PreviousTypes,j::StartsWith) = getindex(A,i,StartsWithHelper(Col(A),j))

getindex(A::Assoc,i::StartsWith,j::PreviousTypes) = getindex(A,StartsWithHelper(Row(A),i),j)

getindex(A::Assoc,i::StartsWith,j::StartsWith) = getindex(A,StartsWithHelper(Row(A),i),StartsWithHelper(Col(A),j))

PreviousTypes = Union{PreviousTypes,StartsWith}


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################
