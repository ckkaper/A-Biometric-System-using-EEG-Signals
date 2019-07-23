function [fusionElements, fusionSteps, meanCRRall] = fusion_algorithm(mahal_distance,Nel,Nsubj,Nruns,CRR)
disp("fusion_algorithm")
disp("mahal_distance")
size(mahal_distance)
disp("CRR")
size(CRR)

%
% Description:
% This function impelments the fusion algorithm that selects 
% the most distinctive channels for every subject
%
% Use:
% [fusionElements, fusionSteps, meanCRRall] = fusion_algorithm(mahal_distance, Nel, Nsubj, Nruns, CRR)
%
% Inputs: 
%      mahal_distance: The mahalanobis distances for between each subject and every class 
%               Size: -
%      Nel    : Number of available channels
%               Size: scalar
%      Nsubj  : The number of subjects 
%               Size: scalar
%      Nvalues: Number of observations for each channel (or else signal size)
%               Size: scalar
%      Nruns  : number of runs
%               Size: scalar
% Outputs: 
%      fusionElements : A set of the most distinctive channels
%                       Size: Vector
%      fusionSteps    : The number of steps the algorithm run in order to retrieve the most distinctive channels
%                       Size: Scalar
%      meanCRRall     : The mean CRR of fusioned values achieved
%                       Size: Scalar
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
        fusionSteps = cs;
    end
end
end
 