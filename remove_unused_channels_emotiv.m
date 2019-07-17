function output = remove_unused_channels_emotiv(dataset,N)
    %-------------------------------------------
    % Input: Complete dataset for every subject
    % Output: Complete dataset with removed unecessary channels
    %--------------------------------------------
    output = zeros(N,14,6000); 
    for i=1:N        
        output(i,:,:) = dataset(i,[1,7,32,36,30,38,26,28,41,42,47,55,61,62],:);  
    end
     
end
% Emotiv for 5 channel sensors -----------------
%   T7 T8 AF3 AF4 PZ
%   https://www.google.com/search?q=emotiv+5+channel+device&client=firefox-b-d&source=lnms&tbm=isch&sa=X&ved=0ahUKEwiIj52ftefiAhUBl4sKHdukCpAQ_AUIECgB&biw=1680&bih=924#imgrc=0pY58g_CNA_RqM:
%
% Emotiv for 32 channel sensors
%   FP1 FP2 AFZ F7G F3F FZK F4F F8G FT10E FC6D FC2C FC1 FC1 FC5 FT9 T7 C3 CZ C4 T8 TPG CP5 CP1 CP2 CP6 TP10 P7 P3 PZ P4 P8 O1 OZ O2 
% asd