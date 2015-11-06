function sqOut(A::Assoc)
    AtA = deepcopy(A)
    if ! isa(A.val[1], Number)
        AtA = logical(A)
    end
    AA = adj(AtA)
    AAtAA = AA * AA';
    AtA.A = AAtAA;
    AtA.col = AtA.row
    return AtA
end

