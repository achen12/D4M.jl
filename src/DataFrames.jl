##Interface with JuliaStat's DataFrame
import DataFrames
function Assoc(df::DataFrame)
    #Sorting Columns
    tempcolumn = df.colindex.names
    tempcolumn = [(tempcolumn[i],i)  for i in 1:length(tempcolumn)]
    sort!(tempcolumn)

    column_mapping = [x[2] for x in tempcolumn]
    tempcolumn = [x[1] for x in tempcolumn]

    #There are two scenarios
    # 1. The data frame is column saturated, where the first column isn't row names and the header for the first column is labeled.  
    #This is not the standard format csv D4M reads.
    if isempty(searchsorted(tempcolumn,:x))
        column = map(string, tempcolumn)
        row = Array(1:size(df,1))
        mat = Array(df)[:,column_mapping]
    else
    # 2. The data frame isn't column saturated, where the first column is the row names.
    #This is the standard format csv D4M reads.
        xindex = searchsortedfirst(tempcolumn,:x)
        splice!(tempcolumn,xindex)
        splice!(column_mapping,xindex)
        column = map(string, tempcolumn)
        row = Array(df[:x])
        mat = Array(df)[:,column_mapping]
    end
    
    #Begin mapping value
    r,c,v = findnz(mat)
    val = sort!(unique(v))
    v = map(x -> searchsortedfirst(val,x),v)
    A = sparse(r,c,v)
    row = Array{Union{AbstractString,Number},1}(row)
    column = Array{Union{AbstractString,Number},1}(column)
    val = Array{Union{AbstractString,Number},1}(val)
    return Assoc(row,column,val,A)
    
end

using DataFrames.DataFrame
function DataFrame(A::Assoc)
    #This requires some pigeon holing which is in part due to how DataFrame resolve column header collisions.
    fullA = full(A)
    df = DataFrame(fullA[2:end,:])
    
    #name collision pigeon hole
    columnheader = fullA[1,:]'[:]
    if("x" in columnheader)
        index = 1
        while ("x_" * string(index) in columnheader)
            index += 1
        end
        columnheader[findfirst(columnheader,"x")] = "x_"* string(index)
    end

    #update column headers for DataFrame
    columnheader[1] = "x" 
    df.colindex.names = map(symbol,columnheader)
    df.colindex.lookup = Dict(zip(df.colindex.names,1:length(df.colindex.names)))
    return df
end
