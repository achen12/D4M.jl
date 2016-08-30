function Assoc2CSV(A::Assoc,rowSep::Char,colSep::Char,fileName::AbstractString)
    #Assoc2CSV: save Assoc to CSV file
    CsvStr  = Assoc2CSVstr(A,rowSep,colSep) 
    f = open(fileName,"w")
    write(f, CsvStr)
    close(f)
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

