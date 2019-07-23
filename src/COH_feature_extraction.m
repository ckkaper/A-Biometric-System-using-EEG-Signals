function [coherence] = COH_feature_extraction(dataset, Nsubj, Nel, Nvalues)
%
disp("COH_feature_extraction")
disp("dataset");
size(dataset)
% Description:
% This function firstly finds all the combinations for every available channel in 
% the brain and then computes their spectral coherence for frequencies [1 - 40] Hz. 
%
% Use:
% [pathRows, pathCols, el] = COH_feature_extraction(dataset, Nsubj, Nel, Nvalues)
%
% Inputs: 
%      dataset: The preprocessed dataset 
%               Size: Nsubj x Nel x Nvalues
%      Nsubj  : The number of subjects 
%               Size: scalar
%      Nel    : Number of available channels
%               Size: scalar
%      Nvalues: Number of observations for each channel (or else signal size)
%               Size: scalar
% Outputs: 
%      coherence: The coherence between every channel for every subject
%                 Size: Nsubj x combos_size x Nvalues
%
% Author: Kyriakos Kaperonis
%         Signal processing & Communications Lab 
%         Department of Computer Engineering & Informatics 
%         University of Patras
  combinations = nchoosek(Nel,2);     
  coherence = zeros(Nsubj,length(combinations),Nvalues);     
  combos = nchoosek(1:Nel,2);
  combos_size = size(combos);
  combos_size = combos_size(1);
    for s=1:Nsubj       
        for i=1:combos_size
            x = squeeze(dataset(s,combos(i,1),:));
            y = squeeze(dataset(s,combos(i,2),:));
            temp_coherence = mscohere(x,y,hann(100),[],100)';
            coherence(s,i,:) = temp_coherence(1:40);
        end
    end
end