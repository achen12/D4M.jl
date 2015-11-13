module D4M
    example_pDB01_DataTEST = x -> include("../examples/3Scaling/2ParallelDatabase/pDB01_DataTEST.jl")
    example_pDB02_FileTEST = x -> include("../examples/3Scaling/2ParallelDatabase/pDB02_FileTEST.jl")
    example_pDB03_AssocTEST = x -> include("../examples/3Scaling/2ParallelDatabase/pDB03_AssocTEST.jl")
    example_pDB04_DegreeTEST = x -> include("../examples/3Scaling/2ParallelDatabase/pDB04_DegreeTEST.jl")
    example_AI1_SetupTEST = x -> include("../examples/1Intro/1AssocIntro/AI1_SetupTEST.jl")
    example_AI2_SubsrefTEST = x -> include("../examples/1Intro/1AssocIntro/AI2_SubsrefTEST.jl")
    example_AI3_MathTEST = x -> include("../examples/1Intro/1AssocIntro/AI3_MathiTEST.jl")
    example_AI4_AdvConstructTEST = x -> include("../examples/1Intro/1AssocIntro/AI4_AdvConstructTEST.jl")

end
include("Assoc_orig.jl") #Status: in Dev
include("WriteCSV.jl")
include("ReadCSV.jl")
include("OutDegree.jl")
include("NumStr.jl")
