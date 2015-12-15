function Z = computeLayer(X,W,c)
X=[1;X];
Z=W*X;
%M = mean(Z)
Z=sigmf(Z,[1 c]);

end