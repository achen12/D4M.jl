# This is the getindex function for Assoc, the Associate Array.
import Base.getindex
StringOrNumArray  = Union{AbstractString,Array,Number}

function getindex(A::Assoc, i::Array{Int64}, j::Array{Int64})
    #Check if A is empty
    if nnz(A.A) == 0
    return Assoc(i,j,0,(+))
    end

    return Assoc(A.row[i],A.col[j],A.val,A.A[i,j])
    end

#Singular Case
getindex(A::Assoc,i::Any)                  = getindex(A,i,:)

##Variations between Int, Array{Int}, Colon,Range #TODO Make not horrible
getindex(A::Assoc,i::Int64,j::Any)         = getindex(A,[i],j)
getindex(A::Assoc,i::Any,j::Int64)         = getindex(A,i,[j])

getindex(A::Assoc,i::Colon,j::Any)         = getindex(A,1:size(A.row,1),j)
getindex(A::Assoc,i::Any,j::Colon)         = getindex(A,i,1:size(A.col,1))

getindex(A::Assoc,i::Range,j::Any)         = getindex(A,collect(i),j)
getindex(A::Assoc,i::Any,j::Range)         = getindex(A,i,collect(j))


#Variations of Strings   TODO Make not horrible

getindex(A::Assoc, i::AbstractString, j::Any)  = getindex(A, find( x -> in(x,StrUnique(i)[1]),A.row), j)
getindex(A::Assoc, i::Any ,j::AbstractString)  = getindex(A, i ,find( x -> in(x,StrUnique(j)[1]),A.col))


#= Scrap Code
function getindex(A::Assoc,i::StringOrNumArray,j::StringOrNumArray)
    #Check if A is empty
    if nnz(A.A) == 0
        return Assoc(i,j,0,(+))
    end
    #Check i and j are matchin row and col type for A. TODO
        #Sould allow vector, collection{T}, colon, csv string, and regex.
    if ( !isa(i,typeof(A.row))) || (!isa(j, typeof(A.col)))
        throw(DomainError())
    end
    #Convert Str i,j to accum's indexing via mapping TODO
        #check if regex
        if isa(i,Regex)
            if isa(A.row,Array{AbstractString})
                i = find([match(i,x)for x in A.row])
                else
                throw(DomainError()) #attempt to D
            end
            
        end
        #check if csv string
        #check if collection{T}

    #Access accum, copy, and form new assoc array TODO
end


function getindex(A:Assoc,i::StringOrNumArry)  = getindex(A,i,:)
=#
