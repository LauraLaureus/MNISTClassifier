function [W,W2,MSE] =  NeuralNetworkTrain(labels, images)

num_images = size(images,2); 
%W = rand(1,785);
W = rand(28,785);
W2 = rand(10,28);
MSE = zeros(1,num_images);

for i=1:num_images
    Z=[1; images(:,i)];
    %Forward
    Z = computeLayer(Z,W);
    Z2 = computeLayer(Z,W2);
    %Z3 = computeLayer(Z2,W3);
    
    %TODO Error
    label = labels(i);
    label_vector = zeros(10,1);
    label_vector(label+1) = 1;
    
    error = Z2-label_vector;
    MSE(i) = sum(error.^2);
    
    %TODO BackPropagation
    delta_out = zeros(10,1);
    for k=1:10
        delta_out(k) = (label_vector(k) - Z2(k))*(1-Z2(k))*Z2(k);
    end
    
    delta_hidden  = zeros(28,1);
    for k=1:28
        suma = 0;
        for j=1:10
            suma = suma + delta_out(j)*W2(j,k);
        end
        delta_hidden(k) = Z(k)*(1-Z(k))*suma;
    end
    
    W = W+0.1*Z'*delta_hidden;
    W2 = W2+0.1*Z2'*delta_out;
    
    
end


end