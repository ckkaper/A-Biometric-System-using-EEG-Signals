function output = remove_unused_channels_region(dataset,N,region)
%
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
%         Signal processing & Communications 
%         Department of Computer Engineering & Informatics 
%         University of Patras
    output = zeros(N,24,6000); 
    switch region
    case 'C'
        for i=1:N        
            output(i,:,:) = dataset(i,[1:14,41:42,16:21,45,46],:);  
        end
    case 'F'
        for i=1:N        
          output(i,:,:) = dataset(i,[22:24,26:28,30:38],:);  
        end
    case 'P'
        for i=1:N        
            output(i,:,:) = dataset(i,[47:60,61,63],:);  
        end
    end
end