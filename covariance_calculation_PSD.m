function [covariance_m] = covariance_calculation_PSD(PSD, Nruns, Nsubj, Nel, Nvalues)
   
    
    complete_matrix = zeros(Nruns,Nel,Nvalues,(Nruns - 1)*Nsubj);
    
    
 
    %--------------- Covariance calculation 
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
    %---------------------------------------
    covariance_m = zeros(Nruns,Nel,Nvalues,Nvalues);
    %----------- Covariance Calculation ----
    for i=1:Nruns
        for j=1:Nel
            covariance_m(i,j,:,:) = (1/((Nruns - 1)*Nsubj))*(squeeze(complete_matrix(i,j,:,:))*squeeze(complete_matrix(i,j,:,:))');
            
        end
    end
    %---------------------------------------
end