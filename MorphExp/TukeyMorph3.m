function y = TukeyMorph3(a,b,frames)
% This function implements John Tukey's suggestion for how to morph between
% two spectrogram frames.  First compute the cumulative sum, then match
% up points that are equal in (cumulative) energy.  This only works with
% inharmonic sounds (or spectral profiles without the pitch).   Also needs
% to use the interpolation scheme described on page 117 of my first IRC
% log book (TimeWarp).

if (nargin < 3) frames = 100; end

if (size(a,1) > size(a,2)) a=a'; end
if (size(b,1) > size(b,2)) b=b'; end

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
%plot([ca cb cb(warp)])

y=zeros(len,frames);
unwarp = (1:len)';
for i=1:frames
		y(:,i) = TimeWarp(a,b,warp,zeros(1,size(b,2)),(i-1)/(frames-1))';
end
