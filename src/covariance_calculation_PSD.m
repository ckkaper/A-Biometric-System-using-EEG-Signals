function [covariance_m] = covariance_calculation_PSD(PSD, Nruns, Nsubj, Nel, Nvalues)
%
disp("covariance_caluclation_PSD");
disp("PSD");
size(PSD)

% Description:
% This function computes the pooled covariance matrix of every class (subject) for the feature 
% of Power Spectral Density. 
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
    complete_matrix = zeros(Nruns,Nel,Nvalues,(Nruns - 1)*Nsubj);

    for e=1:Nel
        matrix_f = zeros(Nruns,Nsubj,Nel,Nvalues);
        for j=1:Nruns
            matrix_f(j,:,:,:) = PSD(j,:,:,:) - mean(PSD);
        end
        for j=1:Nruns
            matrix = matrix_f;
            matrix(j,:,:,:) = []; 
            for k=1:(Nruns-1)                          
                complete_matrix(j,e,:,(1 + (k-1)*Nsubj):k*Nsubj) = squeeze(matrix(k,:,e,:))';
            end
        end
    end    

    covariance_m = zeros(Nruns,Nel,Nvalues,Nvalues);
    
    for i=1:Nruns
        for j=1:Nel
            covariance_m(i,j,:,:) = (1/((Nruns - 1)*Nsubj))*(squeeze(complete_matrix(i,j,:,:))*squeeze(complete_matrix(i,j,:,:))');
            
        end
    end
end