import Base.print

#=
print : print Assoc in tabular form.
=#
function print(A::Assoc)
    output = full(A.A)
    if ! isa(A.val[1],Number)
        output = Array{AbstractString,2}([ if A.A[x,y] != 0 
        string(A.val[A.A[x,y]])
        else
        ""
        end
        for x = 1:length(A.row), y = 1:length(A.col)])
    end
    output = vcat(A.col',output)
    output = hcat(vcat("0",A.row),output)
    dump(output)
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

