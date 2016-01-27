import JLD.readas
import JLD.writeas

#=
Assoc Serialized for saving
Note that saving would convert row and col types to number.
=#

type AssocSerial
    rowstr::AbstractString
    colstr::AbstractString
    valstr::AbstractString

    rownum::AbstractString
    colnum::AbstractString
    valnum::AbstractString
    
    A::AbstractSparseMatrix
end

function JLD.writeas(data::Assoc)
    #Get parts from the assoc
    row = Row(data)
    col = Col(data)
    val = Val(data)
    A   = Adj(data)

    #Split the mapping array into string and number arraries for storage
    rowindex = searchsortedfirst(row,AbstractString,lt=isa)
    colindex = searchsortedfirst(col,AbstractString,lt=isa)
    valindex = searchsortedfirst(val,AbstractString,lt=isa)
    #test if there are string elements in the array
    if (rowindex == 1)
        rowstr = ""
    else
        rowstr = join(row[1:(rowindex-1)],",");
    end

    if (colindex == 1)
        colstr = ""
    else
        colstr = join(col[1:(colindex-1)],",");
    end
    
    if (valindex == 1)
        valstr = ""
    else
        valstr = join(val[1:(valindex-1)],",");
    end
    
    #test if there are number elements in the array.  Note that by serialization all numbers will be converted to float.

    if (rowindex == size(row,1)+1)
        rownum = ""
    else
        rownum = join(row[rowindex:end],",");
    end

    if (colindex == size(col,1)+1)
        colnum = ""
    else
        colnum = join(col[colindex:end],",");
    end
    
    if (valindex == size(val,1)+1)
        valnum = ""
    else
        valnum = join(val[valindex:end],",");
    end


    #Reconstitute converted parts into Serialized

    return AssocSerial(rowstr,colstr,valstr,rownum,colnum,valnum,A)
end

function JLD.readas(serData::AssocSerial)
    row = []
    if serData.rowstr != ""
       row = vcat(row, split(serData.rowstr,",")) ;
    end
    if serData.rownum != ""
        row = vcat(row, map(float,split(serData.rownum,",")));
    end
    row = Array{Union{AbstractString,Number}}(row)

    col = []
    if serData.colstr != ""
       col = vcat(col, split(serData.colstr,",")) ;
    end
    if serData.colnum != ""
        col = vcat(col, map(float,split(serData.colnum,",")));
    end
    col = Array{Union{AbstractString,Number}}(col)
    
    val = []
    if serData.valstr != ""
       val = vcat(val, split(serData.valstr,",")) ;
    end
    if serData.valnum != ""
        val = vcat(val, map(float,split(serData.valnum,",")));
    end
    val = Array{Union{AbstractString,Number}}(val)
    
    

    return Assoc(row,col,val,serData.A)
end
