function [fusionElements, CRRsteps,meanCRRall] = fusion_algorithm(mahal_distance,Nel,Nsubj,Nruns,CRR)

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
 