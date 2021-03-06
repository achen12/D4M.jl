function WriteCSV(A::Assoc,fname)
#Because of potential memory issues, the Assoc will not be converted to dense matrix, but instead directly printed onto the file.

iostream = open(fname,"w")

#First write column
for c = 1:size(A.col,1)
    write(iostream,',') #Separator
    print(iostream,A.col[c])
end

write(iostream,"\n")

valMap = !isempty(A.val) #Check if val needs to be mapped.
#For each row write in row
for r = 1:size(A.row,1)
    print(iostream,A.row[r])
    for c = 1:size(A.col,1)
        write(iostream,',')
        if A.A[r,c] != 0
            if valMap #Mapping needed
                write(iostream,A.val[A.A[r,c]])
            else #Mappping not needed.
                print(iostream,A.A[r,c])
            end
            end
    end
    write(iostream,"\n")
    flush(iostream) #Clear buffer for each line.
end
#Close stream.
close(iostream)
end


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

