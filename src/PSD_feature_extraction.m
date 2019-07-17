 function [feature_vector] = PSD_feature_extraction(dataset,Nsubj, Nel, Nvalues) 
   temp_PSD = zeros(Nsubj,Nel,51);
   feature_vector = zeros(Nsubj, Nel,Nvalues);
   dataset = squeeze(dataset);
   for i=1:Nsubj
       %a = pwelch(dataset(:,:,i)', hann(100),[],100)';
       %for k=1:Nel
        %temp_PSD(i,k,:) = calc_psd(squeeze(dataset(i,k,:))', 100,100,hann(100))';
       %end
       temp_PSD(i,:,:) = pwelch(squeeze(dataset(i,:,:))', hann(100),[],100)';
       
       feature_vector(i,:,:) = temp_PSD(i,:,1:Nvalues); 
       %  OOOOOOOOOOOOOORRR
       % feature_vector(i,:,:) = temp_PSD(i,:,2:41); 
       %  ENDD OOOOOOOOORRR
         
       % a step that may help the results is if we divice the feature
       % try it later if your results are like :(   
        
   end
end