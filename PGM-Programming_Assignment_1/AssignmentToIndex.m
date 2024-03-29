% AssignmentToIndex Convert assignment to index.
%
%   I = AssignmentToIndex(A, D) converts an assignment, A, over variables
%   with cardinality D to an index into the .val vector for a factor. 
%   If A is a matrix then the function converts each row of A to an index.
%
%   See also IndexToAssignment.m and FactorTutorial.m

function I = AssignmentToIndex(A, D)

D = D(:)'; % ensure that D is a row vector
if (any(size(A) == 1)),
    I = cumprod([1, D(1:end - 1)]) * (A(:) - 1) + 1;

else
    I = sum(repmat(cumprod([1, D(1:end - 1)]), size(A, 1), 1) .* (A - 1), 2) + 1;
end;

end
