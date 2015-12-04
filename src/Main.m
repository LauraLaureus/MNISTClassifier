function Main
%Load train labels and images
labels = loadMNISTLabels('train-labels.idx1-ubyte');
images = loadMNISTImages('train-images.idx3-ubyte');

disp('Train labels and images loaded properly')
disp('NeuralNetwork training...')

[W,W2,MSE] = NeuralNetworkTrain(labels, images);

plot(1:size(MSE,2),MSE);

end