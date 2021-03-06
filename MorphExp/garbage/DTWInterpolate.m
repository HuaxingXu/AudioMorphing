function y = DTWInterpolate(a,b,lambda)
% y = Intepolate(a,b,lambda)
% This function computes a straightforward interpolation between two
% multi-dimensional prototypes, a and b.  Lambda is a fraction between
% 0 and 1.

if (nargin < 3) lambda = 0.5; end

if (size(a,1) < size(a,2)) a=a'; end
if (size(b,1) < size(b,2)) b=b'; end

[error,path1,path2] = dtw4(a/max(a), b/max(b))
[index1,index2] = TimeWarpPaths(path1, path2, lambda);

y = (1-lambda)*a(index1) + lambda*b(index2);
%plot([a b y]);drawnow;
