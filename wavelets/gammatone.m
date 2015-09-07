gammatone_order = 3;
bandwidth = 20;
center_frequency = 200;
sample_rate = 1000;
duration = 0.5;
nSamples = sample_rate * duration;
samples = linspace(0,duration,nSamples);
polynomial = samples.^(gammatone_order-1);
exponential = exp(-bandwidth*samples);
sine_wave = exp(1i*center_frequency*samples);
gammatone = 1000 * polynomial .* exponential .* sine_wave;
re_gammatone = real(gammatone);
im_gammatone = imag(gammatone);
abs_gammatone = abs(gammatone);

%%
addpath('/Users/vincent/Documents/lorentz_jan15/altmany-export_fig-6c11f9f')
aspect_ratio = 4/3;
width = 525;
h = figure(1);
set(h,'resize','off');
plot([re_gammatone;im_gammatone;abs_gammatone].','LineWidth',1.2);
height = width/aspect_ratio;
set(h,'Position',[0 0 width height]);
ti = get(gca,'TightInset')
set(gca,'Position',[ti(1) ti(2) 1-ti(2)-ti(1) 1-ti(4)-ti(2)])
axis off;
export_fig gammatone.png -transparent