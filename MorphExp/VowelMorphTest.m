sr=22050;
len = 4;

t=(1:(sr/4))/sr;
window=1/2*cos(t*4*pi)+1/2;
window = [fliplr(window) ones(1,len*sr-2*length(window)) window];

a = window .* MakeVowel(len*sr, 200, sr, 'a');
u = window .* MakeVowel(len*sr, 250, sr, 'u');
i = window .* MakeVowel(len*sr, 300, sr, 'i');

au = SyncMorph(a, u, sr);
ia = SyncMorph(i, a, sr);
ui = SyncMorph(u, i, sr);

aus = SpectrumInversion(SpectralTilt(au,-1),64,256);
ias = SpectrumInversion(SpectralTilt(ia,-1),64,256);
uis = SpectrumInversion(SpectralTilt(ui,-1),64,256);

WriteSound([aus zeros(1,sr/4) uis zeros(1,sr/4) ias], sr, 'auia-morph.aiff');
