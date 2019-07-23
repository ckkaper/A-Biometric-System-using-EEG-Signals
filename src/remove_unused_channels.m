function output = remove_unused_channels(dataset,Nsubj,device)
%
% Description:
% This function discards unused channels according to the divice topology
% is selected in the parameters
%
% Use:
% [output] = remove_unsused_channels(dataset, Nsubj, Nel, Nvalues)
%
% Inputs: 
%      dataset: The preprocessed dataset
%               Size: Nsubj x Nel x Nvalues
%      Nsubj  : The number of subjects 
%               Size: scalar
%      device : A string that difines the device topology
%               Size: string
% Outputs: 
%      output: The input dataset after unused channels are removed
%              Size: Nsubj x combos_size x Nvalues
%
% Author: Kyriakos Kaperonis
%         Signal processing & Communications 
%         Department of Computer Engineering & Informatics 
%         University of Patras
    switch device
    case 'ALL'
        channels = [1:24,26:28,30:38,41:42,45:61,63:63];
    case 'emotiv_epoc_plus'
        channels = [1,7,32,36,30,38,26,28,41,42,47,55,61,62];
    case 'emotiv_insight'
        channels = [41,42,26,28,51];
    case 'emotiv_epoc_flex'
        channels = [22,24,27,30,32,34,36,38,40,7,5,3,1,39,41,9,11,13,42,45,46,47,49,51,53,55,61,62,63];
    end
    output = zeros(Nsubj,max(size(channels)),6000); 
    for i=1:Nsubj
        output(i,:,:) = dataset(i,channels,:);  
    end
    size(output)
    
     
end