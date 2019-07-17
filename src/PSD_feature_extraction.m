 function [feature_vector] = PSD_feature_extraction(dataset,Nsubj, Nel, Nvalues) 
   temp_PSD = zeros(Nsubj,Nel,51);
   feature_vector = zeros(Nsubj, Nel,Nvalues);
   dataset = squeeze(dataset);
   for i=1:Nsubj
       temp_PSD(i,:,:) = pwelch(squeeze(dataset(i,:,:))', hann(100),[],100)';
       feature_vector(i,:,:) = temp_PSD(i,:,1:Nvalues); 
   end
end