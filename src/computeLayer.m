function Z = computeLayer(X,W,c)
X=[1;X];
Z=W*X;
Z=sigmf(Z./100,[1 0]);

end