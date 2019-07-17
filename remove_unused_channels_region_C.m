function output = remove_unused_channels_region_C(dataset,N)
    %-------------------------------------------
    % Input: Complete dataset for every subject
    % Output: Complete dataset with removed unecessary channels
    %--------------------------------------------
    output = zeros(N,24,6000); 
    for i=1:N        
        output(i,:,:) = dataset(i,[1:14,41:42,16:21,45,46],:);  
    end
     
end