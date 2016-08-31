% Creates corr_mat_ideal, matrix of simFC-empFC corrs for all subjects: 
%       AASim ACSim AYSim (based on each subs ideal params)
%AAEmp
%ACEmp
%AYEmp
%
% Takes ALL, struct from Paul. corr_mat_ideal based on the simFC of ideal
% params for that subject.

corr_mat = zeros(50,50); 
subs = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'LG_20140324_1130_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QL_20120814_SC.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
ideal_csf = {'0.14', '0.14', '0.15', '0.14', '0.13', '0.13', '0.13', '0.17', '0.15', '0.13', '0.13', '0.15', '0.13', '0.14', '0.17', '0.13', '0.15', '0.14', '0.14', '0.14', '0.12', '0.13', '0.14', '0.13', '0.15', '0.14', '0.13', '0.13', '0.13', '0.13', '0.15', '0.13', '0.16', '0.12', '0.15', '0.14', '0.13', '0.14', '0.14', '0.13', '0.13', '0.13', '0.14', '0.13', '0.15', '0.16', '0.14', '0.13', '0.15', '0.14'};
ideal_cs = {'40', '100', '100', '80', '80', '60', '80', '60', '100', '40', '100', '20', '40', '20', '40', '80', '60', '100', '100', '60', '100', '100', '100', '80', '60', '40', '100', '40', '40', '40', '60', '40', '40', '80', '100', '80', '100', '60', '100', '100', '100', '40', '100', '20', '60', '80', '40', '100', '60', '80'};


fields = fieldnames(ALL);
for i = 1:50
    empFC_reshaped = reshape(ALL.(fields{i}).empFC, 68*68,1);
    
    for j = 1:length(subs)

        simFC = load(['/Volumes/MY_DRIVE/Paul_series1/' subs{j} '/cspeed' ideal_cs{j} '/csf ' ideal_csf{j} '/bold.mat']);
        simFC = simFC.arr;
		simFC = squeeze(simFC);
		simFC = simFC(41:end,:);
		simFC = downsample(simFC,4);
		simFC = corr(simFC);
	    simFC_reshaped = reshape(simFC,68*68,1);
  
        corr_mat(i,j) = corr(empFC_reshaped, simFC_reshaped);
    end
end


% To get mean of top triangle:  0.4213
indexu= triu(true(size(corr_mat)),1);
top_tri = corr_mat(indexu);
mean(top_tri)

% To get mean of bottom triangle: 0.4243 
indexl= tril(true(size(corr_mat)),-1);
bottom_tri = corr_mat(indexl);
mean(bottom_tri)

% To get mean of diag: 0.4467
diag_elements = diag(corr_mat);
mean(diag_elements)

% T-Test to evaluate if difference is significant:
H = ttest2(bottom_tri, diag_elements) % *insig!?
H = ttest2(top_tri, diag_elements) % *insig!?