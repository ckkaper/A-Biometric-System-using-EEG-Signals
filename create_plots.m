%b = create_adjacency_matrix(CRR_EC_COH_ALL);
%a = mean(CRR_EC_COH_ALL,2);
% init
addpath('C:\Program Files\MATLAB\R2018b\toolbox\eeglab2019_0');
eeglab;



%PLOT PSD BARIN%
% reproduce results %

% EC
a = mean(CRR_EC_PSD_ALL,2);
CRR_EC_PSD_ALL_fig = figure; 
topoplot(a,'locfile_physionet.loc'); 
cbar('vert',0,[0 1]);
saveas(CRR_EC_PSD_ALL_fig,'CRR_EC_PSD_ALL_fig.ext');
% EO
a = mean(CRR_EO_PSD_ALL,2);

CRR_EO_PSD_ALL_fig = figure; 
topoplot(a,'locfile_physionet.loc'); 
cbar('vert',0,[0 1]);
saveas(CRR_EO_PSD_ALL_fig,'CRR_EO_PSD_ALL_fig.ext');


%PLOT COH ADJ %
figure; topoplot(a,'locfile_physionet.loc'); cbar('vert',0,[0 1]);
