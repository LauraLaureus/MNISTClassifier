function [Output,Z] = NeuralNetworkOutput(X,W,W2)
    Z = computeLayer(X,W);
    Output = computeLayer(Z,W2);
end