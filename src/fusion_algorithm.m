function [fusionElements, CRRsteps,meanCRRall] = fusion_algorithm(mahal_distance,Nel,Nsubj,Nruns,CRR)
disp("fusion_algorithm")
disp("mahal_distance")
size(mahal_distance)
disp("CRR")
size(CRR)

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
mCRR = zeros(Nel,1);
for i=1:Nel
    mCRR(i) = sum(CRR(i,:))/Nruns;
end
[mCRRval,mCRRind] = sort(mCRR,'descend');

fusionElements = mCRRind(1);
CRRsteps = mCRRval(1);
cs = 1;
for s=2:Nel
    h = mCRRind(s);
   
    E = fusionElements;
    t = max(size(E));
    B = zeros(t+1,1);
    B(1:t) = E; 
    B(end) = h;
    CRR = zeros(Nruns,1);
    for r=1:Nruns
        M = zeros(Nsubj,Nsubj);
        score = zeros(Nsubj,Nsubj);
        for m=1:Nsubj            
            for la=1:Nsubj
                score(m,la) = 1./sum(mahal_distance(B,m,la,r));
            end
			[~,index] = max(score(m,:));
			M(m,index) = 1; 
        end
        CRR(r) = sum(diag(M))/Nsubj;        
    end
    meanCRRall = sum(CRR)/Nruns;
    
    if (meanCRRall > CRRsteps)
        fusionElements = B;
        cs = cs + 1;
        CRRsteps = meanCRRall;
    end
end
end
 