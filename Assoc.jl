StringOrNumArray = Union{AbstractString,Array,Number}

include("StrUnique.jl")

type Assoc
    row::Array{Union{AbstractString,Number}}
    col::Array{Union{AbstractString,Number}}
    val::Array{Union{AbstractString,Number}}
    A::AbstractSparseMatrix

    Assoc(rowIn::StringOrNumArray,colIn::StringOrNumArray,valIn::StringOrNumArray) = Assoc(rowIn,colIn,valIn,min) #Setting Default Function

    function Assoc(rowIn::StringOrNumArray,colIn::StringOrNumArray,valIn::StringOrNumArray,funcIn::Function)
        if isempty(rowIn) || isempty(colIn) || isempty(valIn)  #testing needed for isemtpy, for Matlab isemtpy is always possible TODO  Seems to work okay with String or NumArray type hard defined, Union type untested.  Should keep an eye.
            return #Escape
            end
        if isa(rowIn,Number)
            x = rowIn
            rowIn = Array{Number}(1)
            rowIn[1] = x
        end

        if isa(colIn,Number)
            x = colIn
            colIn = Array{Number}(1)
            colIn[1] = x
        end


        if isa(valIn,Number)
            x = valIn
            valIn = Array{Number}(1)
            valIn[1] = x
        end
        i = rowIn;
        j = colIn;
        v = valIn;
        row = rowIn;
        col = colIn;
        val = valIn;

        if isa(rowIn,AbstractString)
            row, i_out2in, i = StrUnique(rowIn); 
            end

        if isa(colIn,AbstractString)
            col, j_out2in, j = StrUnique(colIn); #TODO StrUnique Needs to be implemented
            end

        if isa(valIn,AbstractString)
            val, v_out2in, v = StrUnique(valIn); #TODO StrUnique Needs to be implemented
            #TODO Global Variables needs to be updated.
#            global AssocOldValStrMatGlobal, AssocNewValStrGlobal, AssocValStrIndexGlobal, AssocValCharIndexGlobal
            #AssocOldValStrMatGlobal = str2mat(val) #TODO implement str2mat
 #           AssocNewValStrGlobal = val
  #          AssocNewValstrGlobal = 0
   #         AssocValStrIndexGlobal = 1
    #        AssocValCharIndexGlobal = 1


            #=
            Variables: AssocOldValStrMatGlobal, AssocNewValStrGlobal, AssocValStrIndexGlobal,AssocValCharIndexGlobal

            Updating:
            AssocOldValStrMatGlobal = Str2mat(val) #Changed Val
            AssocNewValStrGlobal = val #OldVal
            AssocNewValStrGlobal = 0;
            AssocValStrIndexGlobal = 1;
            AssocValCharIndexGlobal = 1;

            =#
           
           end 

        #Marker Old Code: Create sparse Connection matrix.
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
        A = sparse(i,j,v,length(i),length(j),(+));
            
        #Accumarray isn't in Julia, use "push" for a more rapid array generation (acccumarray is too slow and cumbersome for Julia)  Sparse matrix generation condition with summation combine seem would do the trick.

        
        #End bit with val string.  Unknown purpose.
        return new(row,col,val,A)
        end
    end
