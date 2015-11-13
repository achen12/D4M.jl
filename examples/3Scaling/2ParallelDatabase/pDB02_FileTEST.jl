
SCALE = 12
EdgesPerVertex = 16

Nmax = 2 ^ SCALE

M = EdgesPerVertex * Nmax

Nfile = 8

myFiles = 1:Nfile

for i = myFiles
    tic()
    fname = "data/" * string(i)
    
    srand(i)#Reset Rand Seed

    v1,v2 = KronGraph500NoPerm(SCALE,round(Int,EdgesPerVertex/Nfile))

    rowStr = join(v1,',')

    colStr = join(v2,',')
    valStr = join(Array{Int}(ones(length(v1))),',')

    fidRow = open(fname * "r.txt","w")
    fidCol = open(fname * "c.txt","w")
    fidVal = open(fname * "v.txt","w")
    
    write(fidRow,rowStr * ",")
    close(fidRow)

    write(fidCol,colStr * ",")
    close(fidCol)
    
    write(fidVal,valStr * ",")
    close(fidVal)
    pTime = toq()
    println("Time: ", pTime)
    println("Edges/sec: ", string(NumStr(rowStr) / pTime))
end


