function B::Assoc = Equallike(arg1,arg2,relop::Function)
    #Equallike: compares the values of an associative array with a scalar.  Filters values of an associative array based on a relational operations that returns boolean and a scalar value that could be either array value index or a string representing the associative array's value.
    #TODO Testing required
    #The original code allows ambiguity on the order of the arguments presented.
    Assoc A;

    A = arg1;
    v = arg2;
    if isa(arg1,Assoc)
        A = arg2
        v = arg1
    end
    A::Assoc #Type assert
    
    B::Assoc = deepcopy(A);
    if isempty(B)
        return B;
    end

    vnum = v

    if !isa(vnum, Int)
        vnum = findfirst(Val(B),v)
    end

    vnum::Int
    
    vind = 0
    if isa(arg1,Assoc)
        vind = find(relop(findnz(B.A)[3],vnum));
    else
        vind = find(relop(vnum,findnz(B.A)[3]));
    end
    
    y = findnz(B.A)
    
    B.A = sparse(y[1][vind],y[2][vind],y[3][vind])

    return deepcondense(B)
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

