function [W, W2] = backpropagation(E,X,Z,Z2,W,W2,alpha)

    delta_out = zeros(10,1);
        for k=1:10
            delta_out(k) = E(k)*(1-Z2(k))*Z2(k);
        end
        
        delta_hidden  = zeros(size(W,1),1);
        for k=1:size(W,1)
            suma = sum(delta_out.*W2(:,k));
            delta_hidden(k) = Z(k)*(1-Z(k))*suma;
        end
        
        W = W+alpha*X*delta_hidden';
        W2 = W2+alpha*Z*delta_out';

end