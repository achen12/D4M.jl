import Base.isempty

function isempty(A::Assoc)
    return isempty(A.A)
end
