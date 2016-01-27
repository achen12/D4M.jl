import Base.isless
import PyPlot
#Allow sorting between Numbers and Strings
isless(A::Number,B::AbstractString) = false
isless(A::AbstractString,B::Number) = true


StringOrNumArray = Union{AbstractString,Array,Number}

#Creation of Assoc require StrUnique to split Single-Character-separated String Sequence.
include("StrUnique.jl")

#=
Type Assoc (Associative Array)
Support a 
=#


type Assoc
    row::Array{Union{AbstractString,Number}}
    col::Array{Union{AbstractString,Number}}
    val::Array{Union{AbstractString,Number}}
    A::AbstractSparseMatrix
    
    Assoc(rowIn::StringOrNumArray,colIn::StringOrNumArray,valIn::StringOrNumArray) = Assoc(rowIn,colIn,valIn,min) 
    Assoc(row::Array{Int64}, col::Array{Int64},val::Array{Int64},A::AbstractSparseMatrix) = new(row,col,val,A)
    #Setting Default Function
    

    function Assoc(rowIn::Array{Union{AbstractString,Number}}, colIn::Array{Union{AbstractString,Number}}, valIn::Array{Union{AbstractString,Number}}, AIn::AbstractSparseMatrix)
        return new(rowIn,colIn,valIn,AIn)
        end

    function Assoc(rowIn::StringOrNumArray,colIn::StringOrNumArray,valIn::StringOrNumArray,funcIn::Function)
        if isempty(rowIn) || isempty(colIn) || isempty(valIn)  #testing needed for isemtpy, for Matlab isemtpy is always possible TODO  Seems to work okay with String or NumArray type hard defined, Union type untested.  Should keep an eye.
            x = Array{Union{AbstractString,Number}}()
            return Assoc(x,x,x,spzeros(1,1));
            end
        if isa(rowIn,Number)
            rowIn = Array{Union{AbstractString,Number},1}([rowIn])
        end

        if isa(colIn,Number)

            colIn = Array{Union{AbstractString,Number},1}([colIn])
        end


        if isa(valIn,Number)
            valIn = Array{Union{AbstractString,Number},1}([valIn])
        end
        i = rowIn;
        j = colIn;
        v = valIn;
        row = rowIn;
        col = colIn;
        val = valIn;

        if isa(rowIn,AbstractString)
            row, i_out2in, i = StrUnique(rowIn); 
            else 
            row = unique(i)
            sort!(row)
            i = AbstractArray([Int64(searchsortedfirst(row,x)) for x in i])
            i = convert(AbstractArray{Int64},i)

            end

        if isa(colIn,AbstractString)
            col, j_out2in, j = StrUnique(colIn);
            else
            col = unique(j)
            sort!(col)
            j = [searchsortedfirst(col,x) for x in j]
            j = convert(AbstractArray{Int64},j)

            end

        if isa(valIn,AbstractString)
            val, v_out2in, v = StrUnique(valIn);           
            else
            val = unique(v)
            sort!(val)
            if (isa(valIn[1],AbstractString))
                k = 0
                if val[1] == "" 
                    k =-1
                end
                v = [searchsortedfirst(val,x)+ k  for x in v]
                v = convert(AbstractArray{Int64},v)
                if val[1] == ""
                    val = val[2:end]
                end
            end
           end 

        NMax = maximum([length(i) length(j) length(v)]);
        if length(i) == 1
            x = i[1]
            i = Array{typeof(x)}(NMax)
            for n = 1:NMax
                i[n] = x
            end
            end

        if length(j) == 1
            x = j[1]
            j = Array{typeof(x)}(NMax)
            for n = 1:NMax
                j[n] = x
            end
            end

        if length(v) == 1
            x = v[1]
            v = Array{typeof(x)}(NMax)
            for n = 1:NMax
                v[n] = x
            end
            end


        

        #i = convert(AbstractArray{Int64},i)
        if isa(val[1],AbstractString) #If the values are string, assume that there are duplicates and take the earliest one ( the numbers should be the same)
            A = sparse(i,j,v,length(row),length(col),min);
        else
            A = sparse(i,j,v,length(row),length(col),(+));
        end
        #Accumarray isn't in Julia, use "push" for a more rapid array generation (acccumarray is too slow and cumbersome for Julia)  Sparse matrix generation condition with summation combine seem would do the trick.

        
        #End bit with val string.  Unknown purpose.
        return new(row,col,val,A)
        end
    end


#=
Adding related operations for Assoc_orig
=#
include("./Assoc_orig/getindex.jl")
include("./Assoc_orig/condense.jl")
include("./Assoc_orig/no.jl")
include("./Assoc_orig/sum.jl")
include("./Assoc_orig/isempty.jl")
include("./Assoc_orig/logical.jl")
include("./Assoc_orig/and.jl")
include("./Assoc_orig/print.jl")
include("./Assoc_orig/transpose.jl")
include("./Assoc_orig/multiply.jl")
include("./Assoc_orig/rdivide.jl")
include("./Assoc_orig/sqIn.jl")
include("./Assoc_orig/sqOut.jl")
include("./Assoc_orig/accessor.jl")
include("./Assoc_orig/find.jl")
include("./Assoc_orig/diag.jl")
include("./Assoc_orig/plus.jl")
include("./Assoc_orig/deepcondense.jl")
include("./Assoc_orig/lt.jl")
include("./Assoc_orig/gt.jl")
include("./Assoc_orig/spy.jl")
include("./Assoc_orig/jld.jl")

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

