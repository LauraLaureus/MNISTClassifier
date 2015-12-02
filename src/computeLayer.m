function Z = computeLayer(X,W)

Z=W*X;
Z=sigmf(Z,[0 0]);

end