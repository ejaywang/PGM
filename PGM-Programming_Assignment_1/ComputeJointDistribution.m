%ComputeJointDistribution Computes the joint distribution defined by a set
% of given factors
%
%   Joint = ComputeJointDistribution(F) computes the joint distribution
%   defined by a set of given factors
%
%   Joint is a factor that encapsulates the joint distribution given by F
%   F is a vector of factors (struct array) containing the factors 
%     defining the distribution
%

function Joint = ComputeJointDistribution(F)

  % Check for empty factor list
  if (numel(F) == 0)
      warning('Error: empty factor list');
      Joint = struct('var', [], 'card', [], 'val', []);      
      return;
  end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE:
% Compute the joint distribution defined by F
% You may assume that you are given legal CPDs so no input checking is required.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[var ia ic] = unique([F([1:length(F)]).var]);
card = [F([1:length(F)]).card];
card = card(ia);
Factor = [];
for i = (1:(length(F)))
	if isempty(Factor) == 1;
		Factor = F(i);
	else
		Factor = FactorProduct(F(i),Factor);
	end
end
Joint = struct('var', var, 'card', card, 'val', Factor.val); % Returns empty factor. Change this.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end

