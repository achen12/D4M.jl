function CsvStr::AbstractString = Assoc2CSVstr(A::Assoc,rowSep::Char,colSep::Char)
    #Assoc2CSVstr: Converts input associative array into a CSV string.
    
    #TODO Test Dense approach is valid.

    #Empty short circuit.
    if(nnz(A)==0)
        return "";
    end
    full(A)
    #TODO doesn't seem implemented?  Perhaps lost in the rm / incident 
    
    return AT
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

