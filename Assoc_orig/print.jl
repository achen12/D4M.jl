import Base.print

function print(A::Assoc)
    output = full(A.A)
    output = vcat(A.col',output)
    output = hcat(vcat("0",A.row),output)
    dump(output)
end
