% Compare EmpFC-simFC (50*50 matrix), (unbiased, because based on 101 simFC's (1 for each csf)) and max of simFC-empFC corrs across all simFCs
%
% cc_mat:
% 		EmpFC (i)
% SimFC (j)

% Note: correlates top triangle of matrices, no significance testing on matrices, non-normal dists

csf = {'0.03', '0.0301', '0.0302', '0.0303', '0.0304', '0.0305', '0.0306', '0.0307', '0.0308', '0.0309', '0.031', '0.0311', '0.0312', '0.0313', '0.0314', '0.0315', '0.0316', '0.0317', '0.0318', '0.0319', '0.032', '0.0321', '0.0322', '0.0323', '0.0324', '0.0325', '0.0326', '0.0327', '0.0328', '0.0329', '0.033', '0.0331', '0.0332', '0.0333', '0.0334', '0.0335', '0.0336', '0.0337', '0.0338', '0.0339', '0.034', '0.0341', '0.0342', '0.0343', '0.0344', '0.0345', '0.0346', '0.0347', '0.0348', '0.0349', '0.035', '0.0351', '0.0352', '0.0353', '0.0354', '0.0355', '0.0356', '0.0357', '0.0358', '0.0359', '0.036', '0.0361', '0.0362', '0.0363', '0.0364', '0.0365', '0.0366', '0.0367', '0.0368', '0.0369', '0.037', '0.0371', '0.0372', '0.0373', '0.0374', '0.0375', '0.0376', '0.0377', '0.0378', '0.0379', '0.038', '0.0381', '0.0382', '0.0383', '0.0384', '0.0385', '0.0386', '0.0387', '0.0388', '0.0389', '0.039', '0.0391', '0.0392', '0.0393', '0.0394', '0.0395', '0.0396', '0.0397', '0.0398', '0.0399', '0.04'};
                                    
cc_mat = zeros(50,50);
max_csf_mat = zeros(50,50);
eigen_mat = zeros(50,50);
subs = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'LG_20140324_1130_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QL_20120814_SC.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
%subs = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat'};

fields = fieldnames(ALL);
    
for i = 1:length(subs) % index of SC. Loop thru SC, fix on one, go into its simFCs in following loop
    empFC = ALL.(fields{i}).empFC; 
    indexe = triu(true(size(empFC)),1);
    empFC_reshaped = empFC(indexe);
    
    [COEFF_e,latent_e,explained_e] = pcacov(empFC);
    emp_PCs = COEFF_e(:,1:10);
    
    

	for j=1:length(subs) %loop thru simFCs, need to go through all params of each simFC too
		csf_simempcorrs = []; % will have 101 vals (the simfc-empfc corrs) when done looping thru csf
        max_eigens = []; % will have 101 vals (the corrs btw best matched PCs of simfc-empfc)
        
		for k=1:length(csf) %looping thru the (101) csfs each time getting its simFC.
       		%% The following is for SimFC from bold:
            simFC = load(['/Volumes/MY_DRIVE/Paul_series2/' subs{j} '/cspeed100/csf ' csf{k} '/bold.mat']);
			simFC = simFC.arr;
			simFC = squeeze(simFC);
			simFC = simFC(41:end,:);
			simFC = downsample(simFC,4);
			
            %% The following is for SimFC from subsample:
            %%simFC = load(['/Volumes/MY_DRIVE/Paul_series2/' subs{j} '/cspeed100/csf ' csf{k} '/subsample.mat']);
            %%simFC = simFC.arr;
            %%simFC = simFC(:,1,:);
            %%simFC = squeeze(simFC);
                                    
            %% The following continues after the above for either bold OR subsample:
            simFC = corr(simFC);
            indexs = triu(true(size(simFC)),1);
	        simFC_reshaped = simFC(indexs);
            
            [COEFF_s,latent_s,explained_s] = pcacov(simFC);
            sim_PCs = COEFF_s(:,1:10);
            eigenvector_corrs = corr(emp_PCs, sim_PCs); % 10*10 corrs btw eigenvectors of empFC(rows) and of SimFC(cols)
            max_eigenvector_corrs = max(eigenvector_corrs,[],2);
            max_eigens(end+1) = max(max_eigenvector_corrs);
            
			csf_simempcorrs(end+1)=corr(simFC_reshaped, empFC_reshaped); %will be 101 long at the end
		end	

		%mean_cc = mean(csf_simempcorrs);
		%cc_mat(j,i) = mean_cc;
                                    
        [max_cc, ind] = max(csf_simempcorrs);
        cc_mat(j,i) = max_cc;
        csf_num = cellfun(@str2num,csf);
        max_csf_mat(j,i) = csf_num(ind);
        
        max_eigen = max(max_eigens);
        eigen_mat(j,i) = max_eigen;
        
        
	end
end	

% To get mean of top triangle: 0.16958
indexu= triu(true(size(cc_mat)),1);
top_tri = cc_mat(indexu);
mean(top_tri)

% To get mean of bottom triangle: 0.18483 
indexl= tril(true(size(cc_mat)),-1);
bottom_tri = cc_mat(indexl);
mean(bottom_tri)

% To get mean of diag: 0.20171
diag_elements = diag(cc_mat);
mean(diag_elements)

% T-Test to evaluate if difference is significant:
H = ttest2(bottom_tri, diag_elements) % sig!
H = ttest2(top_tri, diag_elements) % sig!

imagesc(cc_mat);
colorbar;
xlabel('SimFCs Per Subject', 'fontsize', 14);
ylabel('EmpFCs Per Subject', 'fontsize', 14);
title('Corr between empFC and SimFC (unbiased) across subjects', 'fontsize', 14);