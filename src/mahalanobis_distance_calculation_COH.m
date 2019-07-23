function [mahalanobis_distance,CRR] = mahalanobis_distance_calculation_COH(COH, Nruns, Nsubj, Nel, Nvalues, covariance_matrix,run)
%
disp("mahalanobis_distance_calculation_COH")
disp("COH")
size(COH)
disp("covariance_matrix")
size(covariance_matrix)
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
    m_class = zeros(Nruns,Nel,Nsubj,Nvalues);    
    
        for s=1:Nsubj
            for e=1:Nel
                a = COH(:,s,e,:);               
                a(run,:,:,:) = [];
                m_class(run,e,s,:) = mean(squeeze(a));
            end
        end
    
    mahalanobis_distance = zeros(Nel,Nsubj,Nsubj);
    CRR = zeros(1,Nel);

    for e=1:Nel        
            M = zeros(Nsubj,Nsubj);
            for m=1:Nsubj
                x = squeeze(COH(run,m,e,:));             
             
                for j=1:Nsubj     
                     mahalanobis_distance(e,m,j) = (squeeze(x-squeeze(m_class(run,e,j,:))))'*inv(squeeze(covariance_matrix(e,:,:)))*(squeeze(x-squeeze(m_class(run,e,j,:))));
                end                
                [~,index] = min(mahalanobis_distance(e,m,:));                
                M(m,index) = 1;                
            end
            CRR(e) = (sum(diag(M))/Nsubj);
    end      
end
