function sqOut(A::Assoc)
    AtA = deepcopy(A)
    if !isempty(A)
        warn("Using non numerical associative array for sqOut is not recommended.")
        AtA = logical(A)
    end
    AA = Adj(AtA)
    AAtAA = AA * AA';
    AtA.A = AAtAA;
    AtA.col = AtA.row
    return AtA
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################


