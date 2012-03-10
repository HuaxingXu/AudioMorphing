function [i1,i2]=TimeWarpPaths(path1,path2,lambda)
% Given two warping paths (path1 and path2) as come out of the 
% dtw program.  Find the indices for two signals arrays that generate
% the image fractional lambda between s1 and s2.

l1 = length(path1);
l2 = length(path2);

t = lambda*(path1-(1:l1)) + (1:l1);

newLen = round((l2-l1)*lambda+l1);
i1 = zeros(1,newLen);
i2 = zeros(1,newLen);

for index=1:newLen
	[m lineno] = min((t-index).^2);
	i1(index) = lineno;
end

t = (1-lambda)*(path2-(1:l2)) + (1:l2);
for index=1:newLen
	[m lineno] = min((t-index).^2);
	i2(index) = lineno;
end

