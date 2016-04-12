
#Module for D4M
module D4M

    #=
        Loaded Example
    =#
    module_dir = Pkg.dir("D4M")
    ParallelDatabase_dir = module_dir*"/examples/3Scaling/2ParallelDatabase"
    example_3Scaling_2ParallelDatabase_pDB01_DataTEST = () -> include( ParallelDatabase_dir *"/pDB01_DataTEST.jl")
    example_3Scaling_2ParallelDatabase_pDB02_FileTEST = () -> include( ParallelDatabase_dir *"/pDB02_FileTEST.jl")
    example_3Scaling_2ParallelDatabase_pDB03_AssocTEST = () -> include( ParallelDatabase_dir *"/pDB03_AssocTEST.jl")
    example_3Scaling_2ParallelDatabase__pDB04_DegreeTEST = () -> include( ParallelDatabase_dir *"/pDB04_DegreeTEST.jl")

    AssocIntro_dir = module_dir*"/examples/1Intro/1AssocIntro"
    example_1Intro_1AssocIntro_AI1_SetupTEST = () -> include( AssocIntro_dir * "/AI1_SetupTEST.jl")
    example_1Intro_1AssocIntro_AI2_SubsrefTEST = () -> include( AssocIntro_dir * "/AI2_SubsrefTEST.jl")
    example_1Intro_1AssocIntro_AI3_MathTEST = () -> include( AssocIntro_dir * "/AI3_MathTEST.jl")
    example_1Intro_1AssocIntro_AI4_AdvConstructTEST = () -> include( AssocIntro_dir * "/AI4_AdvConstructTEST.jl")

    EdgeArt_dir = module_dir*"/examples/1Intro/2EdgeArt"
    example_1Intro_2EdgeArt_EA1_GraphTEST = () -> include( EdgeArt_dir * "/EA1_GraphTEST.jl")
    example_1Intro_2EdgeArt_EA2_SubsrefTEST = () -> include( EdgeArt_dir * "/EA2_SubsrefTEST.jl")
    example_1Intro_2EdgeArt_EA3_SubGraphTEST = () -> include( EdgeArt_dir * "/EA3_SubGraphTEST.jl")
    
    EntityAnalysis_dir = module_dir*"/examples/2Apps/1EntityAnalysis"
    example_2Apps_1EntityAnalysis_EA1_GraphTEST = () -> include( EntityAnalysis_dir * "/EA1_ReadTEST.jl")
    example_2Apps_1EntityAnalysis_EA2_SubsrefTEST = () -> include( EntityAnalysis_dir * "/EA2_StatTEST.jl")
    example_2Apps_1EntityAnalysis_EA3_FacetTEST = () -> include( EntityAnalysis_dir * "/EA3_FacetTEST.jl")
    example_2Apps_1EntityAnalysis_EA4_GraphTEST = () -> include( EntityAnalysis_dir * "/EA4_GraphTEST.jl")
    example_2Apps_1EntityAnalysis_EA5_GraphQueryTEST = () -> include( EntityAnalysis_dir * "/EA5_GraphQueryTEST.jl")

    MatrixPerformance_dir = module_dir*"/examples/3Scaling/3MatrixPerformance"
    example_3Scaling_3MatrixPerformance_MP1_DenseTEST = () -> include( MatrixPerformance_dir * "/MP1_DenseTEST.jl")
    example_3Scaling_3MatrixPerformance_MP2_SparseTEST = () -> include( MatrixPerformance_dir * "/MP2_SparseTEST.jl")
    example_3Scaling_3MatrixPerformance_MP3_AssocTEST = () -> include( MatrixPerformance_dir * "/MP3_AssocTEST.jl")
    example_3Scaling_3MatrixPerformance_MP4_AssocCatKeyTEST = () -> include( MatrixPerformance_dir * "/MP4_AssocCatKeyTEST.jl")
    example_3Scaling_3MatrixPerformance_MP5_AssocCatValKeyTEST = () -> include( MatrixPerformance_dir * "/MP5_AssocCatValKeyTEST.jl")
    example_3Scaling_3MatrixPerformance_MP6_AssocPlusTEST = () -> include( MatrixPerformance_dir * "/MP6_AssocPlusTEST.jl")

end


include("Assoc_orig.jl") # Associative Array
include("WriteCSV.jl") #load Assoc from CSV file
include("ReadCSV.jl") #Dump Assoc into a CSV file
include("OutDegree.jl") #Calculate OutDegree
include("NumStr.jl") #Quickly calculate the length of string sequence separated by single-character
#include("CatKeyMul.jl") #CatKeyMultiply
include("CatValMul.jl") #CatValMultiply
include("CatStr.jl")    #Cat String
include("SplitStr.jl")
include("col2type.jl")

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




