function [fusion_elements, CRRsteps] = fusion_algorithm(CRR,mahal_distance,mCRRind,mCRRval,Nel,Nsubj,Nruns)
    disp('$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$')
    disp('inside fusion algorithm');
    disp('CRR');
    size(CRR)
    disp('mahal_distance');
    size(mahal_distance)
    disp('mCRRind');
    size(mCRRind)
    disp('mCRRval');
    size(mCRRval)
    disp('Nel');
    disp(Nel)
    disp('Nsubj');
    disp(Nsubj);
    disp('Nruns');
    disp(Nruns);
    disp('######################################');
    
	% Number of subjects
							% number of subjects
							% number of elements
							% number of cross-validation runs
	%CRR = zeros(6,1);

%	mCRRk = sum(CRR,2)./6;

%	[mCRRval,mCRRind] = sort(mCRRk,'descend');
    E = zeros(1,6);

	% Initialization
	fusion_elements = mCRRind(1);
	CRRsteps = mCRRval(1);
	cs = 1;
	for s=2:Nel
		h = mCRRind(s);
		E = fusion_elements; % maybe it is not need it
		E(size(E)+1,:) = h;
		for r=1:Nruns
			M = zeros(Nsubj,Nsubj);
			for m=1:Nsubj
				score = 1./sum(mahal_distance(1:s,m,:,r));
				[~,index] = max(score);
				M(m,index) = 1;
			end
			CRR(r) = sum(diag(M))/Nsubj;
		end
		mCRR = sum(CRR)/Nruns;

		if mCRR > CRRsteps
			fusion_elements = E;
			cs = cs + 1;
			CRRsteps = mCRR;
		end
	end
end
