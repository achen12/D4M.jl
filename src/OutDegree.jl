function OutDegree(A)
    dout = sum(A,2)
    dout_i,dout_j,dout_v = findnz(dout)
    ndout = sum(sparse(dout_i,dout_v,1),1)
    return ndout
end
