function [mahalanobis_distance,CRR] = mahalanobis_distance_calculation_PSD(PSD,Nruns, Nsubj, Nel, Nvalues, covariance_matrix)
    m_class = zeros(Nruns,Nel,Nsubj,Nvalues);
    
    for r=1:Nruns
        for s=1:Nsubj
            for e=1:Nel
                a = PSD(:,s,e,:);
               
                a(r,:,:,:) = [];
                m_class(r,e,s,:) = mean(squeeze(a));
            end
        end
    end
    
    mahalanobis_distance = zeros(Nel,Nsubj,Nsubj,Nruns);
    CRR = zeros(Nel, Nruns);
    for e=1:Nel        
        for r=1:Nruns
            M = zeros(Nsubj,Nsubj);
            for m=1:Nsubj
                x = squeeze(PSD(r,m,e,:));             
                for j=1:Nsubj
                    mahalanobis_distance(e,m,j,r) = (squeeze(x-squeeze(m_class(r,e,j,:))))'*inv(squeeze(covariance_matrix(r,e,:,:)))*(squeeze(x-squeeze(m_class(r,e,j,:))));                    
                end                
                [~,index] = min(mahalanobis_distance(e,m,:,r));                
                M(m,index) = 1;                
            end
            CRR(e,r) = (sum(diag(M))/Nsubj);
        end
    end      
end
