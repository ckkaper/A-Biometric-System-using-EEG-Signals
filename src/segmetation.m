function output = segmetation(dataset, Nsubj, Nel)
    output = zeros(6,Nsubj,Nel,1000);
    for j=1:6
        output(j,:,:,:) = dataset(:,:,(1 + ((j-1)*1000)):(j*1000));
    end  
end