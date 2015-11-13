function KronGraph500NoPerm(SCALE,EdgePerVertex)
    N = 2^SCALE

    M = round(EdgePerVertex * N)

    A = 0.57
    B = 0.19
    C = 0.19
    D = 1-(A+B+C)

    ij = Array{Int}(ones(2,M))
    ab = A+B
    c_norm = C/(1-(A+B))
    a_norm = A/(A+B)

    for ib = 1:SCALE
        ii_bit = rand(1,M) .> ab
        jj_bit = rand(1,M) .> (c_norm * ii_bit + a_norm * !(ii_bit))
        ij = ij + 2^(ib-1) * [ii_bit;jj_bit]
    end
    return reshape(ij[1,:]',size(ij,2)), reshape(ij[2,:]',size(ij,2))
end
