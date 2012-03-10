function y = Interpolate(a, b, lambda, otherLambda)
% y = Intepolate(a,b,lambda)
% This function computes a straightforward interpolation between two
% multi-dimensional prototypes, a and b.  Lambda is a fraction between
% 0 and 1.

if (nargin < 3) lambda = 0.5; end
if (nargin < 4) otherLambda = 1-lambda; end

if (size(a,1) < size(a,2)) a=a'; end
if (size(b,1) < size(b,2)) b=b'; end

y = otherLambda*a + lambda*b;
%plot([a b y]);drawnow;
