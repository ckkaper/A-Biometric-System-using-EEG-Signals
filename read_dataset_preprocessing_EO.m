function [resampled_dataset] = read_dataset_preprocessing_EO()
    % Initializations
    N = 109;    
    dataset = zeros(N,65,9600);
    resampled_dataset = zeros(N,65,6000);
    for i=1:N
        % Reading dataset
         if i < 10
             file_name = "../S00" + int2str(i) + "R01_edfm.mat";
         elseif i < 100
             file_name = "../S0" + int2str(i) + "R01_edfm.mat";
         else
             file_name = "../S" + int2str(i) + "R01_edfm.mat";
         end  
         
         % Read subject EEG data
         eeg_subject = load(file_name);
         
         % Load dataset to the file 
         dataset(i,:,:) = eeg_subject.val(1:65,1:9600); 

         % Low pass filtering to 1 - 40 Hz
         dataset(i,:,:) = lowpass(squeeze(dataset(i,:,:))',50,160)';
         %dataset(i,:,:) = ft_preproc_lowpassfilter(squeeze(dataset(i,:,:))',160,50)';

         % Resampling the dataset
         resampled_dataset(i,:,:) = resample(squeeze(dataset(i,:,:))',125,200)';
    end
end