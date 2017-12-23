function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C_vector = [0.01;0.03;0.1; 0.3; 1; 3; 10; 30];
sigma_vector = [0.01;0.03;0.1; 0.3; 1; 3; 10; 30];
% mean_vector = zeros(length(C_vector),length(sigma_vector));

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
min_value = 9999999;
row = 0;
column = 0;
for i = 1 : length(C_vector)
    for j = 1 : length(sigma_vector)
        model = svmTrain(X, y, C_vector(i), @(x1, x2) gaussianKernel(x1, x2, sigma_vector(j)));
        predictions = svmPredict(model, Xval);
%       mean_vector(i,j) = mean(double(predictions ~= yval));
        temp_mean = mean(double(predictions ~= yval));
        if(temp_mean <= min_value)
            min_value = temp_mean;
            row = i;
            column = j;
        end
    end
end
% temp_row = row;
% temp_column = column;
% m = min(mean_vector); % ??????????
% mm = min(m);
% [row,column] = find(mean_vector == mm);
C = C_vector(row);
sigma = sigma_vector(column);




% =========================================================================

end
