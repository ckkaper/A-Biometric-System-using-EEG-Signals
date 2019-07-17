% plot_array = [val_CRR_EO_PSD_ALL/100  val_CRR_EC_PSD_ALL/100 val_CRR_EO_COH_ALL/100 val_CRR_EC_COH_ALL/100;
%                 meanCRR_EO_PSD_F meanCRR_EC_PSD_F meanCRR_EO_COH_F meanCRR_EC_COH_F;
%                 meanCRR_EO_PSD_C meanCRR_EC_PSD_C meanCRR_EO_COH_C meanCRR_EC_COH_C;
%                 meanCRR_EO_PSD_P meanCRR_EC_PSD_P meanCRR_EO_COH_P meanCRR_EC_COH_P                
%                 ]*100;
            plot_array = [val_CRR_EO_PSD_insight  val_CRR_EC_PSD_insight val_CRR_EO_COH_insight val_CRR_EC_COH_insight;
                meanCRR_EO_PSD_emotiv_insight meanCRR_EC_PSD_emotiv_insight meanCRR_EO_COH_emotiv_insight meanCRR_EC_COH_emotiv_insight;
                val_CRR_EO_PSD_plus  val_CRR_EC_PSD_plus val_CRR_EO_COH_plus val_CRR_EC_COH_plus;
                meanCRR_EO_PSD_emotiv_epoc_plus meanCRR_EC_PSD_emotiv_epoc_plus meanCRR_EO_COH_emotiv_epoc_plus meanCRR_EC_COH_emotiv_epoc_plus;
                val_CRR_EO_PSD_flex  val_CRR_EC_PSD_flex val_CRR_EO_COH_flex val_CRR_EC_COH_flex;
                meanCRR_EO_PSD_emotiv_epoc_flex meanCRR_EC_PSD_emotiv_epoc_flex meanCRR_EO_COH_emotiv_epoc_flex meanCRR_EC_COH_emotiv_epoc_flex;             
                ]*100;
            
            
            
           a = bar(plot_array);
           a(1).BaseValue = 20;
           set(gca,'xticklabel',{'Single(5 channels)','fusion(5 channels)','single(14 channels)','fusion(14 channels)','single(32 channels)','fusion(32 cahnnels)'})
           a;
         
            hold on;
            legend('PSD EO','PSD EC','COH EO', 'COH EC');