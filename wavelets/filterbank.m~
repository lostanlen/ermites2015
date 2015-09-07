addpath(genpath('/Users/vincent/Documents/MATLAB/mvs/lib'));
%%
N = 4096;
opt.signal_sizes = N;
opt.cutoff_in_dB = 1;
opt.nFilters_per_octave = 12;
opt.max_Q = opt.nFilters_per_octave;
opt.max_scale = Inf;
opt.T = 8;
opt.key.time = cell(1);
opt.has_duals = true;
opt.periodization_extent = 0;
opt.handle = @gammatone_1d;
opt.trim_threshold = 0;
opt.gammatone_order = 3;

bank = create_bank(opt);
[psis,phi,lp] = display_bank(bank);
phi(300:end) = 0;
close all;
addpath('/Users/vincent/Documents/lorentz_jan15/altmany-export_fig-6c11f9f')
aspect_ratio = 13/3;
width = 1050;
nPsis = size(psis,2);
ColorSet = zeros(nPsis,3);
ColorSet(:,1) = linspace(0,1,nPsis).';
ColorSet(:,3) = linspace(1,0,nPsis).';
h = figure(1);
set(gca,'ColorOrder',ColorSet);
hold all;
for psi_index = nPsis:-1:1
    plot(abs(psis(:,psi_index)),'LineWidth',2);
end
plot(abs(phi),'Color','k','LineWidth',2.5);
set(h,'resize','off');
height = width/aspect_ratio;
set(h,'Position',[0 0 width height]);
ti = get(gca,'TightInset')
set(gca,'Position',[ti(1) ti(2) 1-ti(2)-ti(1) 1-ti(4)-ti(2)])
axis off;
set(gcf, 'Colormap', ColorSet);
hcb = colorbar
set(hcb,'YTick',[])
set(hcb,'YTickLabel',[]);
hold off;
export_fig filterbank.png -transparent