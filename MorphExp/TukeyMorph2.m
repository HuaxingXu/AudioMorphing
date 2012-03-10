function y = TukeyMorph2(a,b,frames)
% This function implements John Tukey's suggestion for how to morph between
% two spectrogram frames.  First compute the cumulative sum, then match
% up points that are equal in (cumulative) energy.

if (nargin < 3) frames = 100; end

if (size(a,1) < size(a,2)) a=a'; end
if (size(b,1) < size(b,2)) b=b'; end

len = length(a);

ca=cumsum(a);
ca=ca/ca(len);
cb=cumsum(b);
cb=cb/cb(len);
%plot([ca cb])

warp = zeros(size(a));
for i=1:len
        diff = ca(i) - cb;
        [m ind] = min(diff.*diff);
        warp(i) = ind;
end
plot([ca cb cb(warp)])
pause;
y=zeros(len,frames);
unwarp = (1:len)';
for i=1:frames
        frac = (i-1)/(frames-1);
        ind = round(frac*warp + (1-frac)*unwarp);
        y(:,i) = frac*a(unwarp) + (1-frac)*b(ind);
end
imagesc(y)
