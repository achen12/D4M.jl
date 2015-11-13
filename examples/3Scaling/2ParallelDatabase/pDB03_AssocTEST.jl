Nfile = 8

myFiles = 1:Nfile

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

    pTime = toq()
    println("Sum Time: ", pTime)
    println("Edges/sec: ", string(NumStr(rowStr)/pTime))
end


