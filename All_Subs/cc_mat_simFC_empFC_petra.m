% Compare simFC-empFC (50x50 matrix), (unbiased, because based on simFC's
% based on every subs 'ideal' csfs), average simFC-empFC corrs across
% corrs based on all simFCs based on all ideal csfs)
%
%
% cc_mat:
% 		EmpFC (i)
% SimFC (j)
%
% Note: corrs whole matrices not top triangles, no sig test on matrices,
% non-normal


ideal_csf = {'0.0328', '0.0329', '0.0395', '0.0325', '0.0343', '0.0329', '0.0314', '0.0376', '0.0348', '0.0328', '0.0309', '0.0361', '0.0316', '0.0332', '0.0388', '0.0358', '0.0305', '0.0326', '0.0325', '0.0313', '0.0333', '0.0339', '0.0321', '0.032', '0.0333', '0.0341', '0.0319', '0.0309', '0.0314', '0.0302', '0.0331', '0.034', '0.0332', '0.0327', '0.0336', '0.0321', '0.0317', '0.03', '0.0327', '0.0314', '0.0312', '0.0317', '0.0331', '0.0316', '0.0321', '0.0333', '0.0335', '0.0308', '0.0355', '0.0313'};
cc_mat = zeros(50,50);
subs = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'LG_20140324_1130_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QL_20120814_SC.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
fields = fieldnames(ALL);

for i= 1:50 % loop thru EmpFCs, first fix on EmpFC of subj1

	empFC_reshaped = reshape(ALL.(fields{i}).empFC, 68*68,1);

	for j=1:length(subs) %loop thru simFC?s, need to go through all params of each simFC too 
		ideal_csf_simempcorrs = []; % will have 50 vals (the simfc-empfc corrs) when done looping thru ideal_csf

		for k=1:length(ideal_csf) %looping thru the (50) csfs each time getting its simFC. 
       		simFC = load(['/Volumes/MY_DRIVE/Paul_series2/' subs{j} '/cspeed100/csf ' ideal_csf{k} '/bold.mat']);
			simFC = simFC.arr;
			simFC = squeeze(simFC);
			simFC = simFC(41:end,:);
			simFC = downsample(simFC,4);
			simFC = corr(simFC);
	        simFC_reshaped = reshape(simFC,68*68,1);
			ideal_csf_simempcorrs(end+1)=corr(simFC_reshaped, empFC_reshaped);
		end	

		mean_cc = mean(ideal_csf_simempcorrs);
		cc_mat(j,i) = mean_cc;
	end
end	

% To get mean of top triangle: 0.3257
indexu= triu(true(size(cc_mat)),1);
top_tri = cc_mat(indexu);
mean(top_tri)

% To get mean of bottom triangle: 0.3321
indexl= tril(true(size(cc_mat)),-1);
bottom_tri = cc_mat(indexl);
mean(bottom_tri)

% To get mean of diag: 0.3332
diag_elements = diag(cc_mat);
mean(diag_elements)

% T-Test to evaluate if difference is significant:
H = ttest2(bottom_tri, diag_elements) % not sig
H = ttest2(top_tri, diag_elements) % not sig
