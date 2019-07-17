function [mahalanobis_distance,CRR] = mahalanobis_distance_calculation_COH(COH, Nruns, Nsubj, Nel, Nvalues, covariance_matrix,run)
    %pooled_covariance_matrix = zeros(Nruns,109,40,40);
    % matrix condition estimation
    % condition_of_covariance = zeros(6,109);    
    %----------------------------------------
    m_class = zeros(Nruns,Nel,Nsubj,Nvalues);    
        for s=1:Nsubj
            for e=1:Nel
                a = COH(:,s,e,:);               
                a(run,:,:,:) = [];
                m_class(run,e,s,:) = mean(squeeze(a));
            end
        end
    
    mahalanobis_distance = zeros(Nel,Nsubj,Nsubj);
    %----------------------------------------
    % Calculate Mahalanobis distances
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
