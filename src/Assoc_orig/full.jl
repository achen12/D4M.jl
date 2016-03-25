import Base.full
#=
full : return A in dense String matrix form
=#
function full(A::Assoc)

    output = full(A.A)
    if !(A.val ==[1.0]) #Require Val mapping
        output = Array{AbstractString,2}([
            if A.A[x,y] != 0
                string(A.val[A.A[x,y]])
                else
                ""
                end
                for x = 1:length(A.row), y = 1:length(A.col)
        ])
    end
    output = vcat(A.col',output)
    output = hcat(vcat("",A.row),output)
    return output
end

