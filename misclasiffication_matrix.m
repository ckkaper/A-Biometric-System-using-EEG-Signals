function [matrix] = misclasiffication_matrix(pooled_matrix,test_matrix,N)
    matrix = zeros(N,N);
    group = 1:N;
    grouphat = zeros(N,1);
    dist = zeros(N,1);
    for i=1:N       
        for j=1:N
             mahal_dist = mahal(pooled_matrix(:,:,j), test_matrix(:,:,i));             
             dist(i) = mean(mahal_dist);                   
        end
        [t,predicted(i)] = min(dist);          
        
    end
    matrix = confusionmat(group,predicted);
end