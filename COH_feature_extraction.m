function [coherence] = COH_feature_extraction(dataset, Nsubj, Nel, Nvalues)
  combinations = nchoosek(Nel,2);     
  coherence = zeros(Nsubj,length(combinations),Nvalues);     
  combos = nchoosek(1:Nel,2);
  combos_size = size(combos);
  combos_size = combos_size(1);
    for s=1:Nsubj       
        for i=1:combos_size
            x = squeeze(dataset(s,combos(i,1),:));
            y = squeeze(dataset(s,combos(i,2),:));
            temp_coherence = mscohere(x,y,hann(100),[],100)';
            coherence(s,i,:) = temp_coherence(1:40);
        end
    end
end