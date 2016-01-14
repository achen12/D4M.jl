
#Module for D4M
module D4M

    #=
        Loaded Example
    =#
    module_dir = Pkg.dir("D4M")
    pDB_dir = module_dir*"/examples/3Scaling/2ParallelDatabase"
    example_pDB01_DataTEST = () -> include( pDB_dir *"/pDB01_DataTEST.jl")
    example_pDB02_FileTEST = () -> include( pDB_dir *"/pDB02_FileTEST.jl")
    example_pDB03_AssocTEST = () -> include( pDB_dir *"/pDB03_AssocTEST.jl")
    example_pDB04_DegreeTEST = () -> include( pDB_dir *"/pDB04_DegreeTEST.jl")

    AI_dir = module_dir*"/examples/1Intro/1AssocIntro"
    example_AI1_SetupTEST = () -> include( AI_dir * "/AI1_SetupTEST.jl")
    example_AI2_SubsrefTEST = () -> include( AI_dir * "/AI2_SubsrefTEST.jl")
    example_AI3_MathTEST = () -> include( AI_dir * "/AI3_MathTEST.jl")
    example_AI4_AdvConstructTEST = () -> include( AI_dir * "/AI4_AdvConstructTEST.jl")

    EA_dir = module_dir*"/examples/1Intro/2EdgeArt"
    example_EA1_GraphTEST = () -> include( EA_dir * "/EA1_GraphTEST.jl")
    example_EA2_SubsrefTEST = () -> include( EA_dir * "/EA2_SubsrefTEST.jl")
    example_EA3_SubGraphTEST = () -> include( EA_dir * "/EA3_SubGraphTEST.jl")
    
    MP_dir = module_dir*"/examples/3Scaling/3MatrixPerformance"
    example_MP1_DenseTEST = () -> include( MP_dir * "/MP1_DenseTEST.jl")
    example_MP2_SparseTEST = () -> include( MP_dir * "/MP2_SparseTEST.jl")
    example_MP3_AssocTEST = () -> include( MP_dir * "/MP3_AssocTEST.jl")
    example_MP6_AssocPlusTEST = () -> include( MP_dir * "/MP6_AssocPlusTEST.jl")

end


include("Assoc_orig.jl") # Associative Array
include("WriteCSV.jl") #load Assoc from CSV file
include("ReadCSV.jl") #Dump Assoc into a CSV file
include("OutDegree.jl") #Calculate OutDegree
include("NumStr.jl") #Quickly calculate the length of string sequence separated by single-character
include("CatKeyMul.jl") #CatKeyMultiply
include("CatValMul.jl") #CatValMultiply
include("CatStr.jl")    #Cat String

#Operation that gain performance benefit on sorted inputs
include("sortedintersect.jl")
include("sortedintersectmapping.jl")
include("sortedunion.jl")
include("searchsortedmapping.jl")


########################################################
# D4M: Dynamic Distributed Dimensional Data Model
# Architect: Dr. Jeremy Kepner (kepner@ll.mit.edu)
# Software Engineer: Alexander Chen (alexc89@mit.edu)
########################################################




