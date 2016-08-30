function B::Assoc = Pluslike(arg1,arg2,relop::Function)
    #Pluslike: element wise binary function between two associative arrays.  Will handle 0s in sparse.
    
    #Assumes relop(0,0) = 0

    #TODO Testing required

    #First, get And values

    A_A = spones(arg1.A)
    B_A = spones(arg2.A)

    AB_AB = A_A+B_A

    temp = findnz(AB_A)
    AB_AandBind = find(temp[3].>1)
    AB_AandB = sparse(temp[1][AB_AandBind],temp[2][AB_AandBind],temp[3][AB_AandBind])

    #Separate in to three sets of opertions:
    # (0,b),  (a,0), (a,b)
    
    A_A_AB = A_A+AB_AandB
    temp = findnz(A_A_AB)
    A_Aind = find(temp[3].==1)
    temp = findnz(arg1.A)
    temp_val = map(i-> relop(arg1.val[i],0), temp[A_Aind])
    A = Array[ map(i-> arg1.row[i],temp[1][A_Aind]), map(i->arg1.col[i],temp[2][A_Aind]), temp_val ]


    B_A_AB = B_A+AB_AandB
    temp = findnz(B_A_AB)
    B_Aind = find(temp[3].==1)
    temp = findnz(arg2.A)
    temp_val = map(i-> relop(arg2.val[i],0), temp[3][B_Aind])
    B = Array[ map(i-> arg2.row[i],temp[1][B_Aind]), map(i->arg2.col[i],temp[2][B_Aind]), temp_val ]


    temp = findnz(A_A_AB)
    A_ABind = find(temp[3].==2)
    A_ABval = map(i-> relop(arg1.val[i],0), findnz(arg1.A)[3][A_ABind])

    temp = findnz(B_A_AB)
    B_ABind = find(temp[3].==2)
    B_ABval = map(i-> relop(arg2.val[i],0), findnz(arg2.A)[3][B_ABind])

    ABval = #TODO

    


    
    return deepcondense(B)
end

########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################

