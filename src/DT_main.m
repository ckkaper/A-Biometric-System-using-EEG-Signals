function [CRR, fusion, mahalanobis_distance,meanCRR] = DT_main(eyes_state, region, feature_method )
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
    Nruns = 6;                          % Number of runs
    Nsubj = 109;                        % Number of subjects 
    Nvalues = 40;                       % Values of each feature

    dataset = read_dataset_preprocessing(eyes_state);
   
    % Decide what channels will be used to our experiment
    switch region
    case 'ALL'
        dataset = remove_unused_channels(dataset,Nsubj);
    case 'region_C'
        dataset = remove_unused_channels_region(dataset,Nsubj,'C');
    case 'region_F'
        dataset = remove_unused_channels_region(dataset,Nsubj,'F');
    case 'region_P'
        dataset = remove_unused_channels_region(dataset,Nsubj,'P');
    case 'emotiv_epoc_plus'
        dataset = remove_unused_channels(dataset,Nsubj,'emotiv_epoc_plus');
    case 'emotiv_insight'
        dataset = remove_unused_channels(dataset,Nsubj,'emotiv_insight');
    case 'emotiv_epoc_flex'
        dataset = remove_unused_channels(dataset,Nsubj,'emotiv_epoc_flex');
    end

    input_dataset_size = size(dataset);
    Nel = input_dataset_size(2);
    
    % segment data to 6 non - overlaping epochs
    dataset = segmetation(dataset, Nsubj, Nel);
    
    switch feature_method
    case 'PSD'
        extracted_feature = zeros(Nruns, Nsubj, Nel, Nvalues);
        for Nruns_index=1:Nruns
            [extracted_feature(Nruns_index,:,:,:)] = log10(PSD_feature_extraction(squeeze(dataset(Nruns_index,:,:,:)),Nsubj, Nel, Nvalues));
        end
        [covariance_matrix] = covariance_calculation_PSD(extracted_feature, Nruns, Nsubj, Nel, Nvalues);
        [mahalanobis_distance,CRR] = mahalanobis_distance_calculation_PSD(extracted_feature, Nruns, Nsubj, Nel, Nvalues, covariance_matrix);
        [fusion,CRRsteps,meanCRR] = fusion_algorithm(mahalanobis_distance,Nel,Nsubj,Nruns,CRR);
    case 'COH'
        Nel_comb = nchoosek(Nel,2);
        extracted_feature = zeros(Nruns, Nsubj, Nel_comb, Nvalues);
        for j=1:Nruns
            [extracted_feature(j,:,:,:)] = atanh(COH_feature_extraction(squeeze(dataset(j,:,:,:)), Nsubj, Nel, Nvalues)); 
        end
        CRR = zeros(Nel_comb,Nruns);
        mahalanobis_distance = zeros(Nel_comb,Nsubj,Nsubj,Nruns);
         for j=1:Nruns
             [covariance_matrix] = covariance_calculation_COH(extracted_feature,Nruns, Nsubj, Nel_comb, Nvalues, mean_COH,j);             
             [mahalanobis_distance(:,:,:,j),CRR(:,j)] = mahalanobis_distance_calculation_COH(extracted_feature, Nruns, Nsubj, Nel_comb, Nvalues, covariance_matrix,j);
         end 
         
        [fusion,CRRsteps,meanCRR] = fusion_algorithm(mahalanobis_distance,Nel_comb,Nsubj,Nruns,CRR);
    end
end