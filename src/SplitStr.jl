function SplitStr(s12, sep)
#Given an array of joint array with a separater for each string in the array,
#Split the array in two array with onside of the array on each array.
#Assuem that separator is always inside the elements of s12

    strsplit = [split(x,sep)[y] for x in s12, y in 1:2]
    return strsplit[:,1],strsplit[:,2]

    
end
