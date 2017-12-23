function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
n = length(theta);
grad = zeros(size(theta));
J = 1 / (2 * m) * ((X * theta - y)' * (X * theta - y));
cost_theta = 0;
for k = 2:n
    cost_theta = theta(k)^2 + cost_theta;
end
cost_theta = lambda / (2 * m) * cost_theta;
J = J +cost_theta;
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%
grad = 1 / m * X' * (X * theta - y);
grad(2:n) = grad(2:n) + lambda / m * theta(2:n);
%from 2 to end in vector is not that grad(:,2:end)











% =========================================================================

grad = grad(:);

end
