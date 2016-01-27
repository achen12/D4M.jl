import PyPlot.spy
function spy(A::Assoc)
   spy(Adj(logical(A)) );
   X = Col(A);
   Y = Row(A);
   xticks(0:(length(X)-1), X,rotation="vertical")
   yticks(0:(length(Y)-1), Y)

end
