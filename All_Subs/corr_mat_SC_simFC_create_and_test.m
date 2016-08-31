% Creates corr_mat - mat of corrs between all subs SC and all
% subs 'best' simFC. 
%
% corr_mat:
%			simFC (ie j)
%SC(ie i)
%
% Also mse_mat: mse btw each SC and simFC
% Note: corr top triangle of each, no significance test on matrices, non
% normal dists

addpath ~/Documents/Thesis/FC-and-SC-processing

corr_mat=zeros(50,50);
mse_mat=zeros(50,50);
subs = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'LG_20140324_1130_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QL_20120814_SC.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
fields = fieldnames(ALL);

for i = 1:length(subs) % index of SC. Loop thru SC, fix on one, go into its simFCs in following loop
	SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subs{i} '/weights.txt']);
    indexsc= triu(true(size(SC)),1); 
	SC_reshaped = SC(indexsc);

	for j = 1:50 % index of simFC
		simFC = ALL.(fields{j}).highest_CC_simFC;
        indexs= triu(true(size(simFC)),1); 
        simFC_reshaped = simFC(indexs);
		corr_mat(i,j) = corr(SC_reshaped, simFC_reshaped);
        
        [PSNR,MSE,MAXERR,L2RAT] = measerr(simFC_reshaped,SC_reshaped);
        mse_mat(i,j) = MSE;
	end
end

%%%%%%%% corr_mat:
% To get mean of top triangle: .3688 
indexu= triu(true(size(corr_mat)),1);
top_tri = corr_mat(indexu);
mean(top_tri)

% To get mean of bottom triangle: .3775
indexl= tril(true(size(corr_mat)),-1);
bottom_tri = corr_mat(indexl);
mean(bottom_tri)

% To get mean of diag: .4101
diag_elements = diag(corr_mat);
mean(diag_elements)

% T-Test to evaluate if difference is significant:
H = ttest2(bottom_tri, diag_elements) %* %NOTE: bottom_tri & diag_elements norm dist?
H = ttest2(top_tri, diag_elements) %*

%%%%%%%% mse_mat:
% To get mean of top triangle:  
indexu= triu(true(size(mse_mat)),1);
top_tri = mse_mat(indexu);
mean(top_tri)

% To get mean of bottom triangle: 
indexl= tril(true(size(mse_mat)),-1);
bottom_tri = mse_mat(indexl);
mean(bottom_tri)

% To get mean of diag: 
diag_elements = diag(mse_mat);
mean(diag_elements)

% T-Test to evaluate if difference is significant:
H = ttest2(bottom_tri, diag_elements) %*insig!!!
H = ttest2(top_tri, diag_elements) %*insig!!!
