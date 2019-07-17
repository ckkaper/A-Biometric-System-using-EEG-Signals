function output = segmetation(dataset, Nsubj, Nel)
    % Purpose of this function is to segment the original data into 6
    % epocos in order to be able to make the experiment with the cross
    % validation framework
    % Input: Original dataset 56x6000x109
    % Output: segmented dataset 56x6000x109x6
    
    output = zeros(6,Nsubj,Nel,1000);
    for j=1:6
        output(j,:,:,:) = dataset(:,:,(1 + ((j-1)*1000)):(j*1000));
    end  
    
    
end