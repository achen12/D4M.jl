n = 2 .^ [6 6 7 8 9 10 11 12 13 14 15 16 17 ]
K = 8
MaxGB = 2
MaxGF = 4 * 1.6
m = K .* n
assoc_gbytes = zeros(1,length(n))
assoc_flops = zeros(1,length(n))
assoc_gflops = zeros(1,length(n))
assoc_time = zeros(1,length(n))
for i = 1:length(n)
    ii = round(Int, floor(rand(m[i]) .* n[i]) +1) 
    ii = join(ii,",") *","
    jj = round(Int, floor(rand(m[i]) .* n[i]) +1) 
    jj = join(jj,",") *","
    ii = AbstractString(ii)
    jj = AbstractString(jj)
    A = Assoc(ii,jj,1.0,min)
    ii = round(Int, floor(rand(m[i]) .* n[i]) +1) 
    ii = join(ii,",") *","
    jj = round(Int, floor(rand(m[i]) .* n[i]) +1) 
    jj = join(jj,",") *","
    ii = AbstractString(ii)
    jj = AbstractString(jj)
    B = Assoc(ii,jj,1.0)
    tic()
        C = CatKeyMul(A,B)
    assoc_time[i] = toq()
    assoc_flops[i] = 2*sum(sum(Adj(A*B)))
     ii, jj, vv = find(C)
    assoc_gbytes[i] = assoc_gbytes[i] + (length(ii) + length(jj)) + 8 .* m[i] ./ 1e9
    assoc_gflops[i] = assoc_flops[i] ./ assoc_time[i] ./ 1e9
    print("Time: ", assoc_time[i])
    print(", GFlops: ", assoc_gflops[i])
    println(", GBytes: ", assoc_gbytes[i])
end
