Nfile = 8

myFiles = 1:Nfile

Aout = EmptyAssoc()
Ain = EmptyAssoc()

for i = myFiles
    tic()
    fname = "data/"* string(i)
    
    fidRow = open(fname * "r.txt","r")
    fidCol = open(fname * "c.txt","r")
    fidVal = open(fname * "v.txt","r")
    
    rowStr = readline(fidRow)
    colStr = readline(fidCol)
    valStr = readline(fidVal)

    close(fidRow)
    close(fidCol)
    close(fidVal)

    A = Assoc(rowStr,colStr,1,(sum))
    Aout += sum(A,2)
    Ain  += sum(A,1)


#TODO update Time
    pTime = toq()
    println("Sum Time: ", pTime)
    println("Edges/sec: ", string(NumStr(rowStr)/pTime))
end


#= #PyPlot
figure()
loglog(full(sparse(Adj(Aout),1,1)),"o")
xlabel("out degree")


figure()
loglog(full(sparse(Adj(Ain),1,1)),"o")
xlabel("in degree")

=#
