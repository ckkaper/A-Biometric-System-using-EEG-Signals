function [resampled_dataset] = read_dataset_preprocessing(experiment_case)
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
    N = 109;    
    dataset = zeros(N,65,9600);
    dataset_x = zeros(N,65,9600);
    resampled_dataset = zeros(N,65,6000);
    for i=1:N
        switch experiment_case
        case 'EO'
            if i < 10
                file_name = "../dataset/S00" + int2str(i) + "R01_edfm.mat";
            elseif i < 100
                file_name = "../dataset/S0" + int2str(i) + "R01_edfm.mat";
            else
                file_name = "../dataset/S" + int2str(i) + "R01_edfm.mat";
            end  
        case 'EC'
            if i < 10
                file_name = "../dataset/S00" + int2str(i) + "R02_edfm.mat";
            elseif i < 100
                file_name = "../dataset/S0" + int2str(i) + "R02_edfm.mat";
            else
                file_name = "../dataset/S" + int2str(i) + "R02_edfm.mat";
            end  
        end
        eeg_subject = load(file_name);
        dataset(i,:,:) = eeg_subject.val(1:65,1:9600);
        dataset_x(i,:,:) = lowpass(squeeze(dataset(i,:,:))',50,160)';    
        resampled_dataset(i,:,:) = resample(squeeze(dataset_x(i,:,:))',125,200)';
    end  
 end