function CatStr(s1::Array{AbstractString,1},sep::AbstractString,s2::Array{AbstractString,1})
    #Assume s1 and s2 are arrays of String
    #Also sep is a string 
    s12 = s1 .* [sep] .* s2  
    return s12
end
