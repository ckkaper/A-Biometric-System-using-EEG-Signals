 function [feature_vector] = PSD_feature_extraction(dataset,Nsubj, Nel, Nvalues) 
%
disp("PSD_feature_extraction")
disp("dataset");
size(dataset)

% Description:
% This function computes the power spectral density to all channels for every subject on each run  
%
% Use:
% [PSD_feature] = PSD_feature_extraction(dataset, Nsubj, Nel, Nvalues)
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
%      feature_vector: The power spectral density between coherence between every channel for every subject
%                 Size: Nsubj x combos_size x Nvalues
%
% Author: Kyriakos Kaperonis
%         Signal processing & Communications 
%         Department of Computer Engineering & Informatics 
%         University of Patras
   temp_PSD = zeros(Nsubj,Nel,51);
   feature_vector = zeros(Nsubj, Nel,Nvalues);
   dataset = squeeze(dataset);
   for i=1:Nsubj
       temp_PSD(i,:,:) = pwelch(squeeze(dataset(i,:,:))', hann(100),[],100)';
       feature_vector(i,:,:) = temp_PSD(i,:,1:Nvalues); 
   end
end