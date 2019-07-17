function [adj] = create_adjacency_matrix(CRR,Nel)
    CRR  = mean(CRR,2);   
    adj = zeros(Nel);  
    combos = nchoosek(1:Nel,2);
    combinations = max(size(combos));  
    for i=1:combinations
        adj(combos(i,1),combos(i,2)) = CRR(i);
    end
    adj = adj + adj';
    pcolor(adj*100)
    caxis([30 70])
    
end
% pcolor kai colorbar gia ta results pou tha valeis sti diplomatikara sou 