include("StrUnique.jl")
type Assoc{rowType, colType, valType}
    row::Array{rowType}
    col::Array{colType}
    val::Array{valType}
    A::AbstractSparseMatrix
end
