waveform_path = ...
    '/Users/vincent/Documents/MATLAB/instruments/trumpet_4s_at32k.wav'
[waveform,sample_rate] = wavread(waveform_path);

nSamples = length(waveform);
samples = linspace(-0.5,0.5,nSamples);
sigma = 20;
gaussian = exp(-samples.^2./2*(sigma^2));

lowpassed = conv(waveform,gaussian)