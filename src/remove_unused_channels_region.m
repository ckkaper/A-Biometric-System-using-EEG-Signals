function output = remove_unused_channels_region(dataset,N,region)
%
% Description:
% This function discards unused channels according region defined in parameters 
%
% Use:
% [pathRows, pathCols, el] = remove_unused_channels_region(dataset, 109, 'C')
%
% Inputs: 
%      dataset: The preprocessed dataset 
%               Size: Nsubj x Nel x Nvalues
%      Nsubj  : The number of subjects 
%               Size: scalar
%      region : A string that describes the brain region 'F' 'C' or 'P'
% Outputs: 
%      output : The input dataset with removed channels according to brain regions
%               Size: Nsubj x combos_size x Nvalues
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