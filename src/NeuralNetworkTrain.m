function [W,W2] =  NeuralNetworkTrain(labels, images,alpha,ep)

num_images = size(images,2); 

W = rand(200,785);
W2 = rand(10,200);

Plotable_MSE = zeros(1,ep);
for e=1:ep
    count = 0;
    for i=1:num_images
        X=[1; images(:,i)];
        %Forward
        Z = computeLayer(X,W);
        Z2 = computeLayer(Z,W2);
        
        %TODO Error
        label = labels(i);
        label_vector = zeros(10,1);%column vector
        label_vector(label+1) = 1;
        
        error = label_vector-Z2;
        
        count = count + mean(error.^2);
        
        %TODO BackPropagation
        delta_out = zeros(10,1);
        for k=1:10
            delta_out(k) = error(k)*(1-Z2(k))*Z2(k);
        end
        
        delta_hidden  = zeros(size(W,1),1);
        for k=1:size(W,1)
            suma = sum(delta_out.*W2(:,k));
            delta_hidden(k) = Z(k)*(1-Z(k))*suma;
        end
        
        W = W+alpha*Z'*delta_hidden;
        W2 = W2+alpha*Z2'*delta_out;
        
        
    end
    Ploteable_MSE(e) = count;

end
    plot(1:size(Ploteable_MSE,2),Ploteable_MSE,'b');

end