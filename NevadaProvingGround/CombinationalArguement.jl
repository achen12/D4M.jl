

#################################Test1 : Array Element types
println("==Test 1: Array Element Types==")
println("One is an Integer : ",isa(1, Int64))
println("One is an Number  : ",isa(1, Number))          #At this case it is true, that 1 is a number
println("Array of One is an Array of Integer : ",isa([1],Array{Int64}))
println("Array of One is an Array of Number  : ",isa([1],Array{Number}))  #But isn't [1] an array of number?
println("Make sense \n Parametric type behaves differently than just a subtype matching.  This is to improve the performance such that an Array of Int cannot be confused with a Number type more complex and thus impairing the performance of the algorithms at the lower level.")
println("\n\n\n\n")
#################################Test2 : Union Argument
println("==Test 2: Union Arguments")
x = [1,2,3]
thatfunction(i::Union{Colon,Int64,Array{Int64}}) = x[i]
println("Int?",thatfunction(1))
println("ArrayInt?",thatfunction([1,2]))
println("Colon?",thatfunction(:))
println("Oh wait... It works...")
