import Base.print


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
