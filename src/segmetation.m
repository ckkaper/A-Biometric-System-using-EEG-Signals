function output = segmetation(dataset, Nsubj, Nel)
%
disp("segmetation")
disp("dataset")
disp(dataset)
% Description:
% This function segments the dataset to 6 non overlaping epochs
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
% Outputs: 
%      output : The segmented dataset fragmented to 6 epochs
%                 Size: Nruns x Nsubj x Nel x Nvalues
%
% Author: Kyriakos Kaperonis
%         Signal processing & Communications 
%         Department of Computer Engineering & Informatics 
%         University of Patras
    output = zeros(6,Nsubj,Nel,1000);
    for j=1:6
        output(j,:,:,:) = dataset(:,:,(1 + ((j-1)*1000)):(j*1000));
    end  
end