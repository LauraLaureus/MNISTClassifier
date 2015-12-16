function Main
%Load train labels and images
labels = loadMNISTLabels('train-labels.idx1-ubyte');
images = loadMNISTImages('train-images.idx3-ubyte');

disp('Train labels and images loaded properly')
disp('NeuralNetwork training...')

[W,W2] = NeuralNetworkTrain(labels, images,0.1,50);
disp('Train is over')

disp('Loading test labels')
test_labels = loadMNISTLabels('t10k-labels.idx1-ubyte');
disp('Loading test images')
test_images = loadMNISTImages('t10k-images.idx3-ubyte');
disp('Starting test...')
NeuralNetworkTest(W,W2,test_images,test_labels);



end