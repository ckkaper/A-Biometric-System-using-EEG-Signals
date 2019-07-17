function output = remove_unused_channels_region_F(dataset,N)
    %-------------------------------------------
    % Input: Complete dataset for every subject
    % Output: Complete dataset with removed unecessary channels
    %--------------------------------------------
    output = zeros(N,15,6000); 
    for i=1:N        
        output(i,:,:) = dataset(i,[22:24,26:28,30:38],:);  
    end
     
end