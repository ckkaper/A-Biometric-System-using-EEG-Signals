function [] = create_plot(data)
    a = mean(data,2);
    figure;
    caxis([0.5 1]);
    topoplot(a,'locfile_emotiv_epoc_flex.loc','maplimits',[0.5 0.9]); 
%     cbar('vert',0,[0.5 1]);
   
end