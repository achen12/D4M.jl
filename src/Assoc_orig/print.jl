import Base.print

#=
print : print Assoc in tabular form.
=#
function print(A::Assoc)
    dump(full(A))
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

