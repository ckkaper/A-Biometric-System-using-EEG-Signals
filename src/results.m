  tic; 
  [CRR_EO_PSD_F,   fusion_EO_PSD_F, mahalanobis_distance_EO_PSD_F,meanCRR_EO_PSD_F] = DT_main('EO', 'region_F', 'PSD');
  save('ResultsFusion\CRR_EO_PSD_F','CRR_EO_PSD_F');
  save('ResultsFusion\fusion_EO_PSD_F','fusion_EO_PSD_F');
  save('ResultsFusion\mahalanobis_distance_EO_PSD_F','mahalanobis_distance_EO_PSD_F');
  save('ResultsFusion\meanCRR_EO_PSD_F','meanCRR_EO_PSD_F');
  [CRR_EO_PSD_C,   fusion_EO_PSD_C, mahalanobis_distance_EO_PSD_C,meanCRR_EO_PSD_C] = DT_main('EO', 'region_C', 'PSD');
  save('ResultsFusion\CRR_EO_PSD_C','CRR_EO_PSD_C');
  save('ResultsFusion\fusion_EO_PSD_C','fusion_EO_PSD_C');
  save('ResultsFusion\mahalanobis_distance_EO_PSD_C','mahalanobis_distance_EO_PSD_C');
  save('ResultsFusion\meanCRR_EO_PSD_C','meanCRR_EO_PSD_C');
  [CRR_EO_PSD_P,   fusion_EO_PSD_P, mahalanobis_distance_EO_PSD_P,meanCRR_EO_PSD_P] = DT_main('EO', 'region_P', 'PSD' );
  save('ResultsFusion\CRR_EO_PSD_P','CRR_EO_PSD_P');
  save('ResultsFusion\fusion_EO_PSD_P','fusion_EO_PSD_P');
  save('ResultsFusion\mahalanobis_distance_EO_PSD_P','mahalanobis_distance_EO_PSD_P');
  save('ResultsFusion\meanCRR_EO_PSD_P','meanCRR_EO_PSD_P');
 [CRR_EO_PSD_ALL, fusion_EO_PSD_ALL, mahalanobis_distance_EO_PSD_ALL, meanCRR_EO_PSD_ALL] = DT_main('EO', 'ALL', 'PSD' );
 save('ResultsFusion\CRR_EO_PSD_ALL','CRR_EO_PSD_ALL');
 save('ResultsFusion\fusion_EO_PSD_ALL','fusion_EO_PSD_ALL');
 save('ResultsFusion\mahalanobis_distance_EO_PSD_ALL','mahalanobis_distance_EO_PSD_ALL');
 save('ResultsFusion\meanCRR_EO_PSD_ALL','meanCRR_EO_PSD_ALL');
  [CRR_EO_COH_F,   fusion_EO_COH_F , mahalanobis_distance_EO_COH_F, meanCRR_EO_COH_F] = DT_main('EO', 'region_F', 'COH' );
  save('ResultsFusion\CRR_EO_COH_F','CRR_EO_COH_F');
  save('ResultsFusion\fusion_EO_COH_F','fusion_EO_COH_F');
  save('ResultsFusion\mahalanobis_distance_EO_COH_F','mahalanobis_distance_EO_COH_F');
  save('ResultsFusion\meanCRR_EO_COH_F','meanCRR_EO_COH_F');
  [CRR_EO_COH_C,   fusion_EO_COH_C,mahalanobis_distance_EO_COH_C,meanCRR_EO_COH_C] = DT_main('EO', 'region_C', 'COH' );
  save('ResultsFusion\CRR_EO_COH_C','CRR_EO_COH_C');
  save('ResultsFusion\fusion_EO_COH_C','fusion_EO_COH_C');
  save('ResultsFusion\mahalanobis_distance_EO_COH_C','mahalanobis_distance_EO_COH_C');
  save('ResultsFusion\meanCRR_EO_COH_C','meanCRR_EO_COH_C');
% 
  [CRR_EO_COH_P,   fusion_EO_COH_P, mahalanobis_distance_EO_COH_P,meanCRR_EO_COH_P] = DT_main('EO', 'region_P', 'COH' );
  save('ResultsFusion\CRR_EO_COH_P','CRR_EO_COH_P');
  save('ResultsFusion\fusion_EO_COH_P','fusion_EO_COH_P');
  save('ResultsFusion\mahalanobis_distance_EO_COH_P','mahalanobis_distance_EO_COH_P');
  save('ResultsFusion\meanCRR_EO_COH_P','meanCRR_EO_COH_P');
 [CRR_EC_PSD_ALL, fusion_EC_PSD_ALL, mahalanobis_distance_EC_PSD_ALL,meanCRR_EC_PSD_ALL] = DT_main('EC', 'ALL', 'PSD' );
 save('ResultsFusion\CRR_EC_PSD_ALL','CRR_EC_PSD_ALL');
 save('ResultsFusion\fusion_EC_PSD_ALL','fusion_EC_PSD_ALL');
 save('ResultsFusion\mahalanobis_distance_EC_PSD_ALL','mahalanobis_distance_EC_PSD_ALL');
 save('ResultsFusion\meanCRR_EC_PSD_ALL','meanCRR_EC_PSD_ALL');
% 
  [CRR_EC_PSD_F,   fusion_EC_PSD_F, mahalanobis_distance_EC_PSD_F,meanCRR_EC_PSD_F] = DT_main('EC', 'region_F', 'PSD' );
  save('ResultsFusion\CRR_EC_PSD_F','CRR_EC_PSD_F');
  save('ResultsFusion\fusion_EC_PSD_F','fusion_EC_PSD_F');
  save('ResultsFusion\mahalanobis_distance_EC_PSD_F','mahalanobis_distance_EC_PSD_F');
  save('ResultsFusion\meanCRR_EC_PSD_F','meanCRR_EC_PSD_F');
% 
  [CRR_EC_PSD_C,   fusion_EC_PSD_C, mahalanobis_distance_EC_PSD_C,meanCRR_EC_PSD_C ] = DT_main('EC', 'region_C', 'PSD' );
  save('ResultsFusion\CRR_EC_PSD_C','CRR_EC_PSD_C');
  save('ResultsFusion\fusion_EC_PSD_C','fusion_EC_PSD_C');
  save('ResultsFusion\mahalanobis_distance_EC_PSD_C','mahalanobis_distance_EC_PSD_C');
  save('ResultsFusion\meanCRR_EC_PSD_C','meanCRR_EC_PSD_C');
% 
  [CRR_EC_PSD_P,   fusion_EC_PSD_P, mahalanobis_distance_EC_PSD_P,meanCRR_EC_PSD_P] = DT_main('EC', 'region_P', 'PSD' );
  save('ResultsFusion\CRR_EC_PSD_P','CRR_EC_PSD_P');
  save('ResultsFusion\fusion_EC_PSD_P','fusion_EC_PSD_P');
  save('ResultsFusion\mahalanobis_distance_EC_PSD_P','mahalanobis_distance_EC_PSD_P');
  save('ResultsFusion\meanCRR_EC_PSD_P','meanCRR_EC_PSD_P');
%   
  [CRR_EC_COH_F,   fusion_EC_COH_F, mahalanobis_distance_EC_COH_F,meanCRR_EC_COH_F] = DT_main('EC', 'region_F', 'COH' );
  save('ResultsFusion\CRR_EC_COH_F','CRR_EC_COH_F');
  save('ResultsFusion\fusion_EC_COH_F','fusion_EC_COH_F');
  save('ResultsFusion\mahalanobis_distance_EC_COH_F','mahalanobis_distance_EC_COH_F');
  save('ResultsFusion\meanCRR_EC_COH_F','meanCRR_EC_COH_F');
% 
  [CRR_EC_COH_C,   fusion_EC_COH_C, mahalanobis_distance_EC_COH_C,meanCRR_EC_COH_C] = DT_main('EC', 'region_C', 'COH' );
  save('ResultsFusion\CRR_EC_COH_C','CRR_EC_COH_C');
  save('ResultsFusion\fusion_EC_COH_C','fusion_EC_COH_C');
  save('ResultsFusion\mahalanobis_distance_EC_COH_C','mahalanobis_distance_EC_COH_C');
  save('ResultsFusion\meanCRR_EC_COH_C','meanCRR_EC_COH_C');
  [CRR_EC_COH_P,   fusion_EC_COH_P, mahalanobis_distance_EC_COH_P, meanCRR_EC_COH_P] = DT_main('EC', 'region_P', 'COH' );
  save('ResultsFusion\CRR_EC_COH_P','CRR_EC_COH_P');
  save('ResultsFusion\fusion_EC_COH_P','fusion_EC_COH_P');
  save('ResultsFusion\mahalanobis_distance_EC_COH_P','mahalanobis_distance_EC_COH_P');
  save('ResultsFusion\meanCRR_EC_COH_P','meanCRR_EC_COH_P');
%  
 [CRR_EC_COH_ALL, fusion_EC_COH_ALL, mahalanobis_distance_EC_COH_ALL,meanCRR_COH_ALL] = DT_main('EC', 'ALL', 'COH' );
 save('ResultsFusion\CRR_EC_COH_ALL','CRR_EC_COH_ALL');
 save('ResultsFusion\fusion_EC_COH_ALL','fusion_EC_COH_ALL');
 save('ResultsFusion\mahalanobis_distance_EC_COH_ALL','mahalanobis_distance_EC_COH_ALL');
 save('ResultsFusion\meanCRR_EC_COH_ALL','meanCRR_EC_COH_ALL');
 [CRR_EO_COH_ALL, fusion_EO_COH_ALL, mahalanobis_distance_EO_COH_ALL, meanCRR_EC_COH_ALL] = DT_main('EO', 'ALL', 'COH' );
 save('ResultsFusion\CRR_EO_COH_ALL','CRR_EO_COH_ALL');
 save('ResultsFusion\fusion_EO_COH_ALL','fusion_EO_COH_ALL');
 save('ResultsFusion\mahalanobis_distance_EO_COH_ALL','mahalanobis_distance_EO_COH_ALL');
 save('ResultsFusion\meanCRR_EO_COH_ALL','meanCRR_EO_COH_ALL');
 % ----------------------------------------------------------------------------------------------------------------------------------------
 % ----------------------------------------------------------------------------------------------------------------------------------------
 % ----------------------------------------CALCULATIONS-FOR-EVERY-DEVICE-------------------------------------------------------------------
 % ----------------------------------------------------------------------------------------------------------------------------------------
 % ----------------------------------------------------------------------------------------------------------------------------------------
[CRR_EO_COH_emotiv_epoc_plus, fusion_EO_COH_emotiv_epoc_plus, mahalanobis_distance_EO_COH_emotiv_epoc_plus, meanCRR_EO_COH_emotiv_epoc_plus] = DT_main('EO', 'emotiv_epoc_plus', 'COH' );
save('ResultsFusion\CRR_EO_COH_emotiv_epoc_plus','CRR_EO_COH_emotiv_epoc_plus');
save('ResultsFusion\fusion_EO_COH_emotiv_epoc_plus','fusion_EO_COH_emotiv_epoc_plus');
save('ResultsFusion\mahalanobis_distance_EO_COH_emotiv_epoc_plus','mahalanobis_distance_EO_COH_emotiv_epoc_plus');
save('ResultsFusion\meanCRR_EO_COH_emotiv_epoc_plus','meanCRR_EO_COH_emotiv_epoc_plus');
 
  [CRR_EO_COH_emotiv_insight, fusion_EO_COH_emotiv_insight, mahalanobis_distance_EO_COH_emotiv_insight, meanCRR_EO_COH_emotiv_insight] = DT_main('EO', 'emotiv_insight', 'COH' );
  save('ResultsFusion\CRR_EO_COH_emotiv_insight','CRR_EO_COH_emotiv_insight');
  save('ResultsFusion\fusion_EO_COH_emotiv_insight','fusion_EO_COH_emotiv_insight');
  save('ResultsFusion\mahalanobis_distance_EO_COH_emotiv_insight','mahalanobis_distance_EO_COH_emotiv_insight');
  save('ResultsFusion\meanCRR_EO_COH_emotiv_insight','meanCRR_EO_COH_emotiv_insight');
 
 [CRR_EO_COH_emotiv_epoc_flex, fusion_EO_COH_emotiv_epoc_flex, mahalanobis_distance_EO_COH_emotiv_epoc_flex, meanCRR_EO_COH_emotiv_epoc_flex] = DT_main('EO', 'emotiv_epoc_flex', 'COH' );
  save('ResultsFusion\CRR_EO_COH_emotiv_epoc_flex','CRR_EO_COH_emotiv_epoc_flex');
  save('ResultsFusion\fusion_EO_COH_emotiv_epoc_flex','fusion_EO_COH_emotiv_epoc_flex');
  save('ResultsFusion\mahalanobis_distance_EO_COH_emotiv_epoc_flex','mahalanobis_distance_EO_COH_emotiv_epoc_flex');
  save('ResultsFusion\meanCRR_EO_COH_emotiv_epoc_flex','meanCRR_EO_COH_emotiv_epoc_flex');
 
 [CRR_EC_COH_emotiv_epoc_plus, fusion_EC_COH_emotiv_epoc_plus, mahalanobis_distance_EC_COH_emotiv_epoc_plus, meanCRR_EC_COH_emotiv_epoc_plus] = DT_main('EC', 'emotiv_epoc_plus', 'COH' );
 save('ResultsFusion\CRR_EC_COH_emotiv_epoc_plus','CRR_EC_COH_emotiv_epoc_plus');
 save('ResultsFusion\fusion_EC_COH_emotiv_epoc_plus','fusion_EC_COH_emotiv_epoc_plus');
 save('ResultsFusion\mahalanobis_distance_EC_COH_emotiv_epoc_plus','mahalanobis_distance_EC_COH_emotiv_epoc_plus');
 save('ResultsFusion\meanCRR_EC_COH_emotiv_epoc_plus','meanCRR_EC_COH_emotiv_epoc_plus');

  [CRR_EC_COH_emotiv_insight, fusion_EC_COH_emotiv_insight, mahalanobis_distance_EC_COH_emotiv_insight, meanCRR_EC_COH_emotiv_insight] = DT_main('EC', 'emotiv_insight', 'COH' );
  save('ResultsFusion\CRR_EC_COH_emotiv_insight','CRR_EC_COH_emotiv_insight');
  save('ResultsFusion\fusion_EC_COH_emotiv_insight','fusion_EC_COH_emotiv_insight');
  save('ResultsFusion\mahalanobis_distance_EC_COH_emotiv_insight','mahalanobis_distance_EC_COH_emotiv_insight');
  save('ResultsFusion\meanCRR_EC_COH_emotiv_insight','meanCRR_EC_COH_emotiv_insight');
% 
 [CRR_EC_COH_emotiv_epoc_flex, fusion_EC_COH_emotiv_epoc_flex, mahalanobis_distance_EC_COH_emotiv_epoc_flex, meanCRR_EC_COH_emotiv_epoc_flex] = DT_main('EC', 'emotiv_epoc_flex', 'COH' );
 save('ResultsFusion\CRR_EC_COH_emotiv_epoc_flex','CRR_EC_COH_emotiv_epoc_flex');
 save('ResultsFusion\fusion_EC_COH_emotiv_epoc_flex','fusion_EC_COH_emotiv_epoc_flex');
 save('ResultsFusion\mahalanobis_distance_EC_COH_emotiv_epoc_flex','mahalanobis_distance_EC_COH_emotiv_epoc_flex');
 save('ResultsFusion\meanCRR_EC_COH_emotiv_epoc_flex','meanCRR_EC_COH_emotiv_epoc_flex');

  [CRR_EC_PSD_emotiv_epoc_plus, fusion_EC_PSD_emotiv_epoc_plus, mahalanobis_distance_EC_PSD_emotiv_epoc_plus, meanCRR_EC_PSD_emotiv_epoc_plus] = DT_main('EC', 'emotiv_epoc_plus', 'PSD' );
  save('ResultsFusion\CRR_EC_PSD_emotiv_epoc_plus','CRR_EC_PSD_emotiv_epoc_plus');
  save('ResultsFusion\fusion_EC_PSD_emotiv_epoc_plus','fusion_EC_PSD_emotiv_epoc_plus');
  save('ResultsFusion\mahalanobis_distance_EC_PSD_emotiv_epoc_plus','mahalanobis_distance_EC_PSD_emotiv_epoc_plus');
  save('ResultsFusion\meanCRR_EC_PSD_emotiv_epoc_plus','meanCRR_EC_PSD_emotiv_epoc_plus');

  [CRR_EC_PSD_emotiv_insight, fusion_EC_PSD_emotiv_insight, mahalanobis_distance_EC_PSD_emotiv_insight, meanCRR_EC_PSD_emotiv_insight] = DT_main('EC', 'emotiv_insight', 'PSD' );
  save('ResultsFusion\CRR_EC_PSD_emotiv_insight','CRR_EC_PSD_emotiv_insight');
  save('ResultsFusion\fusion_EC_PSD_emotiv_insight','fusion_EC_PSD_emotiv_insight');
  save('ResultsFusion\mahalanobis_distance_EC_PSD_emotiv_insight','mahalanobis_distance_EC_PSD_emotiv_insight');
  save('ResultsFusion\meanCRR_EC_PSD_emotiv_insight','meanCRR_EC_PSD_emotiv_insight');

  [CRR_EC_PSD_emotiv_epoc_flex, fusion_EC_PSD_emotiv_epoc_flex, mahalanobis_distance_EC_PSD_emotiv_epoc_flex, meanCRR_EC_PSD_emotiv_epoc_flex] = DT_main('EC', 'emotiv_epoc_flex', 'PSD' ); %% maybe bad results
  save('ResultsFusion\CRR_EC_PSD_emotiv_epoc_flex','CRR_EC_PSD_emotiv_epoc_flex');
  save('ResultsFusion\fusion_EC_PSD_emotiv_epoc_flex','fusion_EC_PSD_emotiv_epoc_flex');
  save('ResultsFusion\mahalanobis_distance_EC_PSD_emotiv_epoc_flex','mahalanobis_distance_EC_PSD_emotiv_epoc_flex');
  save('ResultsFusion\meanCRR_EC_PSD_emotiv_epoc_flex','meanCRR_EC_PSD_emotiv_epoc_flex');
%  
  [CRR_EO_PSD_emotiv_epoc_plus, fusion_EO_PSD_emotiv_epoc_plus, mahalanobis_distance_EO_PSD_emotiv_epoc_plus, meanCRR_EO_PSD_emotiv_epoc_plus] = DT_main('EO', 'emotiv_epoc_plus', 'PSD' );
  save('ResultsFusion\CRR_EO_PSD_emotiv_epoc_plus','CRR_EO_PSD_emotiv_epoc_plus');
  save('ResultsFusion\fusion_EO_PSD_emotiv_epoc_plus','fusion_EO_PSD_emotiv_epoc_plus');
  save('ResultsFusion\mahalanobis_distance_EO_PSD_emotiv_epoc_plus','mahalanobis_distance_EO_PSD_emotiv_epoc_plus');
  save('ResultsFusion\meanCRR_EO_PSD_emotiv_epoc_plus','meanCRR_EO_PSD_emotiv_epoc_plus');

  [CRR_EO_PSD_emotiv_insight, fusion_EO_PSD_emotiv_insight, mahalanobis_distance_EO_PSD_emotiv_insight, meanCRR_EO_PSD_emotiv_insight] = DT_main('EO', 'emotiv_insight', 'PSD' );
  save('ResultsFusion\CRR_EO_PSD_emotiv_insight','CRR_EO_PSD_emotiv_insight');
  save('ResultsFusion\fusion_EO_PSD_emotiv_insight','fusion_EO_PSD_emotiv_insight');
  save('ResultsFusion\mahalanobis_distance_EO_PSD_emotiv_insight','mahalanobis_distance_EO_PSD_emotiv_insight');
  save('ResultsFusion\meanCRR_EO_PSD_emotiv_insight','meanCRR_EO_PSD_emotiv_insight');

  [CRR_EO_PSD_emotiv_epoc_flex, fusion_EO_PSD_emotiv_epoc_flex, mahalanobis_distance_EO_PSD_emotiv_epoc_flex, meanCRR_EO_PSD_emotiv_epoc_flex] = DT_main('EO', 'emotiv_epoc_flex', 'PSD' );
  save('ResultsFusion\CRR_EO_PSD_emotiv_epoc_flex','CRR_EO_PSD_emotiv_epoc_flex');
  save('ResultsFusion\fusion_EO_PSD_emotiv_epoc_flex','fusion_EO_PSD_emotiv_epoc_flex');
  save('ResultsFusion\mahalanobis_distance_EO_PSD_emotiv_epoc_flex','mahalanobis_distance_EO_PSD_emotiv_epoc_flex');
  save('ResultsFusion\meanCRR_EO_PSD_emotiv_epoc_flex','meanCRR_EO_PSD_emotiv_epoc_flex');
time_elapsed = toc;