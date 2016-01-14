function CatStr(s1::Array,sep::AbstractString,s2::Array)
    #Assume s1 and s2 are arrays of String
    #Also sep is a string 
    s12 = s1 .* [sep] .* s2  
    return s12
end
