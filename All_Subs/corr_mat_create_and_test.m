% Creates corr_mat, a 50x50 mat of corrs between simFC and empFC. simFC's
% are all based on the same csf and cond speed.
% Presumably highest corrs would be on diags (where simFC & empFC are from
% same subject).
%
%
%corr_mat:
% 			simFC (ie j)
%empFC(ie i)
%
% Note: correlates top triangle of matrices, no significance testing on matrices, non-normal dists



fields = fieldnames(ALL);
subs = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'LG_20140324_1130_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QL_20120814_SC.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};

for i = 1:50 % loop through emp (fix on one, go into its sim in following loop)
	empFC = ALL.(fields{i}).empFC;
    indexe = triu(true(size(empFC)),1); 
    empFC_reshaped = empFC(indexe);

	for j = 1:length(subs) % j=sim index, loop through sim

		load(['/Volumes/MY_DRIVE/Paul_series2/' subs{j} '/cspeed100/csf 0.0328/bold.mat']); %orig .0328
		arr=squeeze(arr);
		arr_cut = arr(41:end,:);
		darr = downsample(arr_cut,4);
		simFC = corr(darr);
        indexs = triu(true(size(simFC)),1);
		simFC_reshaped = simFC(indexs);
		corr_mat(i,j) = corr(empFC_reshaped, simFC_reshaped);
	end
end


% To get mean of top triangle:  0.3613
indexu= triu(true(size(corr_mat)),1);
top_tri = corr_mat(indexu);
mean(top_tri)

% To get mean of bottom triangle:  0.3593
indexl= tril(true(size(corr_mat)),-1);
bottom_tri = corr_mat(indexl);
mean(bottom_tri)

% To get mean of diag:  0.3641
diag_elements = diag(corr_mat);
mean(diag_elements)

% T-Test to evaluate if difference is significant:
H = ttest2(bottom_tri, diag_elements) % not sig
H = ttest2(top_tri, diag_elements) % not sig