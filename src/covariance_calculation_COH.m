function [covariance_m] = covariance_calculation_COH(COH,Nruns, Nsubj, Nel, Nvalues , COH_mean,run)
   
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