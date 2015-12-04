function Z = computeLayer(X,W)

Z=W*X;
Z=sigmf(Z,[1 0]);

end