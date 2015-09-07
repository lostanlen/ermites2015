addpath(genpath('~/MATLAB/scattering.m'));
%%
N = 1024;
opt.signal_sizes = N;
opt.cutoff_in_dB = 3;
opt.nFilters_per_octave = 4;
opt.max_Q = opt.nFilters_per_octave/2;
opt.max_scale = 1024;
opt.T = 1024;
opt.has_duals = true;
opt.periodization_extent = 1;
opt.handle = @gammatone_1d;
opt.trim_threshold = eps(single(1))/10;
opt.gammatone_order = 3;
%
assert(~any(mod(log2(opt.signal_sizes),1)));
bank.spec = fill_bank_spec(opt);
bank.metas = fill_bank_metas(bank.spec);
nGammas = length(bank.metas);

raw_psis = generate_psis(bank.metas,bank.spec);
raw_psis(1,:) = 0; % enforces one vanishing moment
psi_index = 3;
psi_ft = raw_psis(:,psi_index);
re_ft = real(psi_ft);
im_ft = imag(psi_ft);
abs_ft = abs(psi_ft);
mat_ft = [re_ft,im_ft,abs_ft];

plot(mat_ft)
%%
addpath('~/MATLAB/export_fig');
aspect_ratio = 4/3;
width = 525;
h = figure(1);
set(h,'resize','off');
plot(mat_ft,'LineWidth',1.2);
height = width/aspect_ratio;
set(h,'Position',[0 0 width height]);
ti = get(gca,'TightInset')
set(gca,'Position',[ti(1) ti(2) 1-ti(2)-ti(1) 1-ti(4)-ti(2)])
axis off;
export_fig gammatone_ft.png -transparent
