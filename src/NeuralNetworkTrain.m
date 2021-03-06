function [W,W2] =  NeuralNetworkTrain(labels, images,alpha,ep)

num_images = size(images,2); 

W = rand(200,785);
W2 = rand(10,201);
c1 = 0;%196.25;
c2 = 0;%50.25;

Ploteable_MSE = zeros(1,ep);
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
        
        count =count + immse(label_vector,Z2);
        
        
        [W ,W2] = backpropagation(error,X,Z,Z2,W,W2,alpha);      
    end
    
    Ploteable_MSE(e) = count/60000

end
    figure;
    plot(1:size(Ploteable_MSE,2),Ploteable_MSE,'b');
    
end