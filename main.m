%function [CRR_COH_EO,CRR_COH_EC,CRR_PSD_EO, CRR_PSD_EC] = main()
        clear;                                                                    %--------------- OK
        clc;                                                                      %--------------- OK
        tic;
        Nruns = 6;
        Nsubj = 109;                                                              %--------------- OK 
         
        dataset = read_dataset_preprocessing_EC();                                %--------------- OK      
        dataset = remove_unused_channels(dataset,Nsubj);                          %--------------- OK      
        input_dataset_size = size(dataset);
        Nel = input_dataset_size(2);              
        Nvalues = 40;                                      
        dataset = segmetation(dataset, Nsubj, Nel);                                    %--------------- OK 

        %PSD_N = zeros(6,109,56,40);
        %PSD = zeros(6,109,56,40);
        Nel_comb = nchoosek(Nel,2); 

        COH = zeros(Nruns, Nsubj, Nel_comb, Nvalues);
        %PSD = zeros(Nruns, Nsubj, Nel, Nvalues);

        for j=1:Nruns
                [COH(j,:,:,:)] = atanh(COH_feature_extraction(squeeze(dataset(j,:,:,:)), Nsubj, Nel, Nvalues));        
        %        [PSD(j,:,:,:)] = log10(PSD_feature_extraction(squeeze(dataset(j,:,:,:)),Nsubj, Nel, Nvalues));
                %[PSD_N(j,:,:,:)] = log10(PSD_feature_extraction(squeeze(dataset(j,:,:,:)),N));%--------------- OK        
        end
        %coh_time = toc;
       % [covariance_matrix_PSD] = covariance_calculation_PSD(PSD, Nruns, Nsubj, Nel, Nvalues);
        %[covariance_matrix_PSD_N] = covariance_calculation_PSD(PSD_N);
        tic;
        %CRR_COH = zeros(6,Nel_comb);
        CRR_PSD = zeros(6,Nel);
        for j=1:Nruns
                [covariance_matrix_COH] = covariance_calculation_COH(COH,Nruns, Nsubj, Nel_comb, Nvalues, mean(COH),j);
                [~,CRR_COH(j,:)] = mahalanobis_distance_calculation_COH(COH, Nruns, Nsubj, Nel_comb, Nvalues, covariance_matrix_COH,j);
        end
        CRR_estimation_time = toc;
        %[covariance_matrix_COH] = covariance_calculation_COH(COH);
        %[mahalanobis_distance_PSD,CRR_PSD] = mahalanobis_distance_calculation_PSD(PSD, Nruns, Nsubj, Nel, Nvalues, covariance_matrix_PSD);
        %[mahalanobis_distance_PSD_N,CRR_PSD_N] = mahalanobis_distance_calculation_PSD(PSD, covariance_matrix_PSD_N);
        %[mahalanobis_distance_COH,CRR_COH] = mahalanobis_distance_calculation_COH(COH, covariance_matrix_COH);

        %surf(CRR);
        %mCRR = mean(CRR,2);
        %[mCRRval,mCRRind] = sort(mCRR,1);
        %[fusion] = fusion_algorithm(CRR,mahalanobis_distance,mCRRind,mCRRval);
        time_elapsed = toc;
        %clearvars -except myVars USEFULL COMMAND FOR DELETING VARS BUT NOT THE WHOLE WORKSPACE
%end