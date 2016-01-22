import Base.(>)
#=
== : get a new Assoc where all of the elements of input Assoc mataches the given Element.
=#
function >(A::Assoc, E::Union{AbstractString,Number})
    tarIndex = searchsortedfirst(Val(A),E)
    if !(E == Val(A)[tarIndex])
        tarIndex = tarIndex-1
        
        println("Hello?")
    end
    println(tarIndex)
    println("Ping?")
    println(isa(E,Number))
    println(A.val == [1.0])
    if (isa(E,Number) & (A.val ==[1.0])  )
        print("Hello!")
        tarIndex = E
    end
    ~, ~, valkey = findnz(A.A)
    mapping = find( x-> x > tarIndex, valkey)
    rows, cols, vals = find(A)
    return Assoc(rows[mapping],cols[mapping],vals[mapping])
end

>(E::Union{AbstractString,Number},A::Assoc) = (A < E)

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

