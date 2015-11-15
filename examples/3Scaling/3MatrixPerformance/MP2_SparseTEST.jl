

n = 2 .^ [6 6 7 8 9 10 11 12 13 14 15 16 17 18]

K = 8

MaxGB = 2
MaxGF = 4 * 1.6

m = K .* n
sparse_gbytes = 9 * 8 * m ./ 1e9
sparse_flops = zeros(1,length(n))
sparse_gflops = zeros(1,length(n))
sparse_time = zeros(1,length(n))

for i = 1:length(n)
    ii = round(Int,floor(rand(m[i]) .* n[i]) +1)
    jj = round(Int,floor(rand(m[i]) .* n[i]) +1)
    A  = sparse(ii , jj , 1.0, n[i], n[i])
    ii = round(Int,floor(rand(m[i]) .* n[i]) +1)
    jj = round(Int,floor(rand(m[i]) .* n[i]) +1)
    B  = sparse(ii,jj,1.0,n[i],n[i])

    tic()
    C = A*B
    sparse_time[i] = toq()

    sparse_flops[i] = 2*sum(C)
    sparse_gflops[i] = sparse_flops[i] ./ sparse_time[i] ./ 1e9

    println("Time: ", string(sparse_time[i]))
    println("GFlops: ", string(sparse_gflops[i]))
    println("GBytes: ", string(sparse_gbytes[i]))

end
#Plot
