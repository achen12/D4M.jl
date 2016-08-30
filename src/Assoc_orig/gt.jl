import Base.(>)
#=
== : get a new Assoc where all of the elements of input Assoc mataches the given Element.
=#
#TODO Should check on how this is going... still have some dev footprints
function >(A::Assoc, E::AssocEleType)
    tarIndex = searchsortedfirst(Val(A),E)
    if !(E == Val(A)[tarIndex])
        tarIndex = tarIndex-1
        
    end
    if (isa(E,Number) & (A.val ==[1.0])  )
        print("Hello!")
        tarIndex = E
    end
    ~, ~, valkey = findnz(A.A)
    mapping = find( x-> x > tarIndex, valkey)
    rows, cols, vals = find(A)
    return Assoc(rows[mapping],cols[mapping],vals[mapping])
end

>(E::AssocEleType,A::Assoc) = (A < E)

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

