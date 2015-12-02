function [W,W2,W3] =  NeuralNetworkTrain(labels, images)

num_images = size(images,2); 
%W = rand(1,785);
W = rand(28,785);
W2 = zeros(28,20);
W3 = zeros(20,10);

for i=1:num_images
    Z=[1; images(:,i)];
    %Forward
    Z = computeLayer(Z,W);
    Z2 = computeLayer(Z,W2);
    Z3 = computeLayer(Z2,W3);
    
    %TODO Error
    %TODO BackPropagation
    
end


end