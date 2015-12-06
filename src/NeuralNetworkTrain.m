function [W,W2] =  NeuralNetworkTrain(labels, images,alpha,ep)

num_images = size(images,2); 

W = rand(28,785);
W2 = rand(10,28);

%MSE = zeros(1,num_images);
Plotable_MSE = zeros(1,num_images*ep);
for e=1:ep
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
        
        Ploteable_MSE(i*e) = mean(error.^2);
        
        %TODO BackPropagation
        delta_out = zeros(10,1);
        for k=1:10
            delta_out(k) = (label_vector(k) - Z2(k))*(1-Z2(k))*Z2(k);
        end
        
        delta_hidden  = zeros(28,1);
        for k=1:28
            suma = sum(delta_out.*W2(:,k));
            %for j=1:10
            %    suma = suma + delta_out(j)*W2(j,k);
            %end
            delta_hidden(k) = Z(k)*(1-Z(k))*suma;
        end
        
        W = W+alpha*Z'*delta_hidden;
        W2 = W2+alpha*Z2'*delta_out;
        
        
    end
    
end
    plot(1:size(Ploteable_MSE,2),Ploteable_MSE,'b');

end