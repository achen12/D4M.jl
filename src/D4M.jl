
#Module for D4M
module D4M

    #=
        Loaded Example
    =#
    example_pDB01_DataTEST = () -> include("../examples/3Scaling/2ParallelDatabase/pDB01_DataTEST.jl")
    example_pDB02_FileTEST = () -> include("../examples/3Scaling/2ParallelDatabase/pDB02_FileTEST.jl")
    example_pDB03_AssocTEST = () -> include("../examples/3Scaling/2ParallelDatabase/pDB03_AssocTEST.jl")
    example_pDB04_DegreeTEST = () -> include("../examples/3Scaling/2ParallelDatabase/pDB04_DegreeTEST.jl")
    example_AI1_SetupTEST = () -> include("../examples/1Intro/1AssocIntro/AI1_SetupTEST.jl")
    example_AI2_SubsrefTEST = () -> include("../examples/1Intro/1AssocIntro/AI2_SubsrefTEST.jl")
    example_AI3_MathTEST = () -> include("../examples/1Intro/1AssocIntro/AI3_MathTEST.jl")
    example_AI4_AdvConstructTEST = () -> include("../examples/1Intro/1AssocIntro/AI4_AdvConstructTEST.jl")
    example_MP1_DenseTEST = () -> include("../examples/3Scaling/3MatrixPerformance/MP1_DenseTEST.jl")
    example_MP2_SparseTEST = () -> include("../examples/3Scaling/3MatrixPerformance/MP2_SparseTEST.jl")
    example_MP3_AssocTEST = () -> include("../examples/3Scaling/3MatrixPerformance/MP3_AssocTEST.jl")
    example_MP6_AssocPlusTEST = () -> include("../examples/3Scaling/3MatrixPerformance/MP6_AssocPlusTEST.jl")

end


include("Assoc_orig.jl") # Associative Array
include("WriteCSV.jl") #load Assoc from CSV file
include("ReadCSV.jl") #Dump Assoc into a CSV file
include("OutDegree.jl") #Calculate OutDegree
include("NumStr.jl") #Quickly calculate the length of string sequence separated by single-character

#Operation that gain performance benefit on sorted inputs
include("sortedintersect.jl")
include("sortedunion.jl")
include("searchsortedmapping.jl")


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################




