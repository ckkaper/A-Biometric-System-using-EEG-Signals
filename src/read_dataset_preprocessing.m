function [resampled_dataset] = read_dataset_preprocessing(experiment_case)
    N = 109;    
    dataset = zeros(N,65,9600);
    dataset_x = zeros(N,65,9600);
    resampled_dataset = zeros(N,65,6000);
    for i=1:N
        switch experiment_case
        case 'EO'
            if i < 10
                file_name = "../dataset/S00" + int2str(i) + "R01_edfm.mat";
            elseif i < 100
                file_name = "../dataset/S0" + int2str(i) + "R01_edfm.mat";
            else
                file_name = "../dataset/S" + int2str(i) + "R01_edfm.mat";
            end  
        case 'EC'
            if i < 10
                file_name = "../dataset/S00" + int2str(i) + "R02_edfm.mat";
            elseif i < 100
                file_name = "../dataset/S0" + int2str(i) + "R02_edfm.mat";
            else
                file_name = "../dataset/S" + int2str(i) + "R02_edfm.mat";
            end  
        end
        eeg_subject = load(file_name);
        dataset(i,:,:) = eeg_subject.val(1:65,1:9600);
        dataset_x(i,:,:) = lowpass(squeeze(dataset(i,:,:))',50,160)';    
        resampled_dataset(i,:,:) = resample(squeeze(dataset_x(i,:,:))',125,200)';
    end  
 end