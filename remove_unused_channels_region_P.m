function output = remove_unused_channels_region_P(dataset,N)
    %-------------------------------------------
    % Input: Complete dataset for every subject
    % Output: Complete dataset with removed unecessary channels
    %--------------------------------------------
    output = zeros(N,16,6000); 
    for i=1:N        
        output(i,:,:) = dataset(i,[47:60,61,63],:);  
    end
     
end
