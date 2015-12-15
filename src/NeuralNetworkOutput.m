function [Output,Z] = NeuralNetworkOutput(X,W,W2,c1,c2)
    Z = computeLayer(X,W,c1);
    Output = computeLayer(Z,W2,c2);
end