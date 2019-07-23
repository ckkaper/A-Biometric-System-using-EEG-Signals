# A Biometric system using EEG Signals

This project was developed in the framework of my Diploma Thesis regarding yielding biometric features using electroencephalography signals. In this experiment 109 subjects are registered and enrolled in a biometric procedure providing 40 channels per person. Two experiments where used for biometric recognition: In the first one, subjects are asked to keep their Eyes Open (EO) and in the second one, they are asked to have their eyes closed. After a preprocessing of the received signals, two feature extraction methods are used: the first uses the Power Spectral Density (PSD) and the second uses Spectral Coherence (COH). Finally, two classification methods are used: the first is the "single element classification" where each EEG channel is considered as a single feature for every subject, and the second is a fusion algorithm in witch a set of the most distinctive elements are extracted for each subject and those are used for identification (classification). Also, in this study, a limitation of channels aproach was studied in order to evaluate the performance of Biometric System using a limited set of channels. Specificaly three different topologies of brain channels where experimented with 32, 14 and 5 channels respectively. The topologies of those channel where in line with the topologies of three commercial EEG signal acquition devices.  
## Dataset
The dataset used for this Thesis was downloaded from  https://www.physionet.org/pn4/eegmmidb/. In this dataset EEG signals where obtained in two sessions. In the first session subjects had Eyes Closed and in the second Session subjects had their Eyes Open. Each session lasts 60 seconds with a device that has 64 channels. 
## Preprocessing
In the following list you can see the preprocessing steps: 
* downsampling from 160 Hz to 100 Hz `read_dataset_and_preprocessing.m`
* Low pass filtering in order to restric frequencies to 50 Hz `read_dataset_and_preprocessing.m`
* Remove some specific channels that dont provide much information according to other studies on EEG Signals`remove_unused_channels.m`
* Segmetation of each subject's signals in 6 different epochs in order to create an evaluation framework for the biometric system. each segmented epoch represents an observation that will be used for training.  `segmetation.m`
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
