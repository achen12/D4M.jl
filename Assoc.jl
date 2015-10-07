StringOrNumArray = Union(String,Array{Number})
type Assoc
    row::Array # Type Julia Unknown TODO
    col:Array # Type Julia Unknown TODO
    val::Array # Type Julia Unknown TODO
    A::Array   # Type Julia Unknown TODO

    function Assoc(row::StringOrNumArray,col::StringOrNumArray,val::StringOrNumArray) = new(row,col,val,min) #Setting Default Function
    function Assoc(row::StringOrNumArray,col::StringOrNumArray,val::StringOrNumArray,func::Function)
        if isempty(row) || isempty(col) || isempty(val)  #testing needed for isemtpy, for Matlab isemtpy is always possible TODO  Seems to work okay with String or NumArray type hard defined, Union type untested.  Should keep an eye.
        return #Escape
        end
        
        i = row;
        j = col;
        v = val;

        if isa(row,String)
            [row i_out2in i] = StrUnique(row,"first"); #TODO StrUnique Needs to be implemented
        end

        if isa(col,String)
            [col j_out2in j] = StrUnique(col,"first"); #TODO StrUnique Needs to be implemented
        end
        if isa(val,String)
            [val v_out2in v] = StrUnique(val,"first"); #TODO StrUnique Needs to be implemented
            #TODO Global Variables needs to be updated.
            global AssocOldValStrMatGlobal, AssocNewValStrGlobal, AssocValStrIndexGlobal, AssocValCharIndexGlobal
            #AssocOldValStrMatGlobal = str2mat(val) #TODO implement str2mat
            AssocNewValStrGlobal = val
            AssocNewValstrGlobal = 0
            AssocValStrIndexGlobal = 1
            AssocValCharIndexGlobal = 1


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
        NMax = max([length(i) length(j) length(v)]);
        if length(i) == 1
            i = repmat(i,NMax,1)
        end
        if length(j) == 1
            j = repmat(j,NMax,1)
        end
        if length(v) == 1
            v = repmat(v,NMax,1)
        end

        #TODO Accumarray isn't in Julia, use "push" for a more rapid array generation (acccumarray is too slow and cumbersome for Julia)
        #Contact Tim Holy and Julio Hoffiman. They seems to have lots of thought on this.

        
        #End bit with val string.  Unknown purpose.

    end
end

