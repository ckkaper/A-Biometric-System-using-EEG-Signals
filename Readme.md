# A Biometric system using EEG Signals

This project represents the implementation of my Diploma Thesis regarding a biometric aproach using electroencephalography signals. In this study 109 subjects are registered and enrolled in the biometric system. In this study two experiments where used for biometric recognition, at the first subjects asked to have Eyes Open (EO) and in the second eperiment subjects where asked to have their eyes closed. After the preprocessing of each subject two feature extraction methods where used the first is Power Spectral Density (PSD) and the second is Spectral Coherence (COH). Also two classification methods where used the first is single element classification where each eeg channel considered as a single feature characteristic for every subject and the second is a fusion algorith in witch a set of the most distinctive elements where extracted for every subject and those where used for identification. Also in this study a limitation of channels aproach was study in order to evaluate the performance of Biometric System using a limited set of channels. 
## Dataset
The dataset used for this Thesis was downloaded from  https://www.physionet.org/pn4/eegmmidb/. In this dataset EEG signals where obtained in two sessions. In the first session subjects had Eyes Closed and in the second Session subjects had their Eyes Open. Each session lasts 60 seconds with a device that has 64 channels. 
## Preprocessing
In the following list you can see the preprocessing steps: 
* downsampling to 100 Hz `read_dataset_and_preprocessing.m`
* Low pass filtering in order to restric frequencies to 50 Hz `read_dataset_and_preprocessing.m`
* Remove some channels that dont provide much of information  `remove_unused_channels.m`
* Segmetation of each subject `segmetation.m`
## Feature Extraction
The following feature extraction methods where used in this study
* Power Spectral Density `PSD_feature_extraction.m`
* Spectral Coherence `COH_feature_extraction.m`
## Classification
The classification method is described by a distance classfier:
* Mahalanobis distance, as you can see there are two files for this implementation the reason for this discrimination is that the available RAM in the test machine didnt allowd as to have a universal function for both methods. 
    - Power Spectral Density `mahalanobis_distance_calculation_COH.m`  
    - Spectral Coherence `mahalanobis_distance_calculation_PSD.m` 
## Fusion Algorith
As for the fusion algorith is described in `fusion_algorithm.m`
## Results
- In order to obtain results the Correct Recognition Metric is used and is calculated at the end of each `mahalanobis_distance_calculation*.m` file.
- `DT_main.m` encapsulates all the functionality described above. 

## Plots
In this section are described some of the most interesting plots a brain reasearch project could have are created using topoplot function from eeglab and its configuration is described in `create_plot.m`

### Prerequisites

In order to use this code you need to have installed:
* MATLAB 2017b+ though older versions of matlab could work with some tuning
* Signal processing toolbox
* Download dataset from https://www.physionet.org/pn4/eegmmidb/ or use your own but you it has to be either on the same format or make the appropriate tuning in `read_dataset_preprocessing.m` file
* eeglab https://sccn.ucsd.edu/eeglab/index.php

### Installing

once you downlaod this repository go to your matlab command line and make sure that MATLAB's path points to this repository, then run the following command in the console:

```
>> results.m
```
where `results.m ` is the file where each case of the ecperiment is called for run

## Code Logic Explenation
During this project implementation an effor has been made to follow functional programming principles
* As described in the Installing section everything starts from `results.m` file where in every case (where case represents an experiment either with different selection 
of channels, different experimend dataset, different feature extraction method etc. ) DT_main function is called properly configured. 
* In `DT_main.m` file you can find the whole code logic where each path is represented using switch command. From there you can see what function is used for and use it following its signature. 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
