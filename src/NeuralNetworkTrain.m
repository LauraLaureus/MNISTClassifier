function [W,W2] =  NeuralNetworkTrain(labels, images,alpha,ep)

num_images = size(images,2); 

W = rand(200,785);
W2 = rand(10,201);
c1 = 196.25;
c2 = 50.25;

Plotable_MSE = zeros(1,ep*num_images);
for e=1:ep
    count = 0;
    for i=1:num_images
        X=[images(:,i)];
        %Forward
        [Z2,Z] = NeuralNetworkOutput(X,W,W2,c1,c2);
        
        %TODO Error
        label = labels(i);
        label_vector = zeros(10,1);%column vector
        label_vector(label+1) = 1;
        
        error = label_vector-Z2;
        
        count = mean(error.^2);
        %Ploteable_MSE(e*num_images+i) = count;
        Ploteable_MSE(e*num_images+i) = immse(Z2,label_vector);
        disp(Ploteable_MSE(e*num_images+i));
        
        [W ,W2] = backpropagation(error,X,Z,Z2,W,W2,alpha);      
    end
   

end
    figure;
    plot(1:size(Ploteable_MSE,2),Ploteable_MSE,'b');
    
end