function [covariance_m] = covariance_calculation_COH(COH,Nruns, Nsubj, Nel, Nvalues , COH_mean,run)
%
disp("covariance_calculation_COH");
disp("COH");
size(COH)
disp("COH_mean");
size(COH_mean)
disp("run")
size(run)
% Description:
% This function computes the pooled covariance matrix of every class (subject) for the feature 
% of spectral coherence 
%
% Use:
% [covariance_m] = covariance_calculation_COH(COH, Nruns, Nsubj, Nel, Nvalues, COH_mean, run)
%
% Inputs: 
%      COH    : The COH feature extracted 
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
    complete_matrix = zeros(Nel,Nvalues,(Nruns-1)*Nsubj); 
 
    for e=1:Nel
            matrix = COH;
            matrix(run,:,:,:) = []; 
            matrix = matrix - mean(matrix);
            for k=1:(Nruns-1)                          
                complete_matrix(e,:,(1 + (k-1)*Nsubj):k*Nsubj) = squeeze(matrix(k,:,e,:))';
            end
    end    

    covariance_m = zeros(Nel,Nvalues,Nvalues);
    
    for j=1:Nel
        covariance_m(j,:,:) = (1/((Nruns - 1)*Nsubj))*(squeeze(complete_matrix(j,:,:))*squeeze(complete_matrix(j,:,:))');
    end
end