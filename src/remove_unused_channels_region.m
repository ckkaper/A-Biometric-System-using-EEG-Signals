function output = remove_unused_channels_region(dataset,N,region)
    output = zeros(N,24,6000); 
    switch region
    case 'C'
        for i=1:N        
            output(i,:,:) = dataset(i,[1:14,41:42,16:21,45,46],:);  
        end
    case 'F'
        for i=1:N        
          output(i,:,:) = dataset(i,[22:24,26:28,30:38],:);  
        end
    case 'P'
        for i=1:N        
            output(i,:,:) = dataset(i,[47:60,61,63],:);  
        end
    end
end