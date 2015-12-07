function NeuralNetworkTest(W,W2,images,labels)

sucess=0;
for img=1:size(images,2)
    %Create label
    label = labels(img);
    
    
    %GetNetwork output
    Y = NeuralNetworkOutput([1; images(:,img)],W,W2);
    
    %Compute error
    [~ ,index] = max(Y);
    if index == label+1 %digits are ordered. 1 2 3 4 5 6 7 8 9 0
        sucess = sucess +1;
    end
    
end    
disp('Tasa de acierto: ')
disp(sucess/size(images,2))
disp('End of test')

end

