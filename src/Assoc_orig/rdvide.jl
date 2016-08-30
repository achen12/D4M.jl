import Base.(./)

#TODO Test needed
(./)(A::Assoc,B::Assoc) = rdvide(A::Assoc,B::Assoc)
function rdvide(A::Assoc,B::Assoc)
    #Check A,B, if string => Logical
    At = A;
    Bt = B;
    if(A.val != [1.0])
        At = logical(A);
    end
    if(B.val !=[1.0])
        Bt = logical(B);
    end
    AB = PlusLike(At,Bt,anddivide);
    return condense(AB) #Check zeros. 
end

function y = anddivide(x1,x2)
   if ((x1 == 0) ||(x2 == 0))
       return 0;
   else
       return x1 / x2;
   end

end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

