function [Z2] = NeuralNetworkOutput(X,W,W2)
    Z = computeLayer(X,W);
    Z2 = computeLayer(Z,W2);
end