% Examines whether modules in empFC are comparable to modules in simFC.
% Get CiSimFC and CiEmpFC, and compare similarity of partitioning using
% Mutual Information. ModMI_mat contains the MI(Mutual Information) between
% the Ci's (the modularity partitions) of EmpFC and SimFC.
% modMI_mat_SC_SimFC contains MI between Ci's of SC and SimFC
%
%       AASim ACSim AYSim (based on each subs ideal params)
%AAEmp
%ACEmp
%AYEmp

addpath ~/Software/Matlab/BCT
ideal_csf = {'0.0328', '0.0329', '0.0395', '0.0325', '0.0343', '0.0329', '0.0314', '0.0376', '0.0348', '0.0328', '0.0309', '0.0361', '0.0316', '0.0332', '0.0388', '0.0358', '0.0305', '0.0326', '0.0325', '0.0313', '0.0333', '0.0339', '0.0321', '0.032', '0.0333', '0.0341', '0.0319', '0.0314', '0.0302', '0.0331', '0.034', '0.0332', '0.0327', '0.0336', '0.0321', '0.03', '0.0327', '0.0314', '0.0312', '0.0317', '0.0331', '0.0316', '0.0321', '0.0333', '0.0335', '0.0308', '0.0355', '0.0313'};
subsSim = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
subsEmp = {'AA_20120815_fMRI_new.mat', 'AC_20120917_fMRI_new.mat', 'AR_20120813_fMRI_new.mat', 'AY_20111004_fMRI_new.mat', 'BQ_20120904_fMRI_new.mat', 'CN_20120927_fMRI_new.mat', 'DA_20120813_fMRI_new.mat', 'DG_20120903_fMRI_new.mat', 'DH_20120806_fMRI_new.mat', 'ER_20120816_fMRI_new.mat', 'EU_20120803_fMRI_new.mat', 'FE_20111010_fMRI_new.mat', 'FI_20120727_fMRI_new.mat', 'FJ_20120808_fMRI_new.mat', 'FR_20120903_fMRI_new.mat', 'GC_20120803_fMRI_new.mat', 'HA_20120813_fMRI_new.mat', 'IC_20120810_fMRI_new.mat', 'IQ_20120904_fMRI_new.mat', 'IS_20120809_fMRI_new.mat', 'JD_20120810_fMRI_new.mat', 'JH_20120925_fMRI_new.mat', 'JH_20121009_fMRI_new.mat', 'JL_20120927_fMRI_new.mat', 'JS_20120910_fMRI_new.mat', 'JZ_20120824_fMRI_new.mat', 'KI_20121009_fMRI_new.mat', 'NI_20120831_fMRI_new.mat', 'NN_20120824_fMRI_new.mat', 'NN_20120831_fMRI_new.mat', 'OG_20120917_fMRI_new.mat', 'OK_20121011_fMRI_new.mat', 'OQ_20120925_fMRI_new.mat', 'QL_20110925_fMRI_new.mat', 'QR_20111010_fMRI_new.mat', 'RF_20120809_fMRI_new.mat', 'RI_20110924_fMRI_new.mat', 'RI_20120815_fMRI_new.mat', 'RQ_20120903_fMRI_new.mat', 'RQ_20120917_fMRI_new.mat', 'RS_20120723_fMRI_new.mat', 'RT_20110925_fMRI_new.mat', 'SE_20110924_fMRI_new.mat', 'UB_20120806_fMRI_new.mat', 'UK_20110924_fMRI_new.mat', 'UK_20111004_fMRI_new.mat', 'XB_20120831_fMRI_new.mat', 'YE_20120910_fMRI_new.mat'};
modMI_mat = zeros(48,48); 
modMI_mat_SC_SimFC = zeros(48,48);
modMI_mat_SC_EmpFC = zeros(48,48);
fields = fieldnames(ALL);

for i= 1:48 % loop thru EmpFCs, first fix on EmpFC of subj1
	
    empTS = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/' subsEmp{i}]);
    empTS = empTS.fmriTS;
    empTS = empTS(1:79,:);
    empFC = corr(empTS);
    CiEmp = modularity_finetune_und_sign(empFC);

    for j = 1:48
        simFC = load(['/Volumes/MY_DRIVE/Paul_series2/' subsSim{j} '/cspeed100/csf ' ideal_csf{j} '/bold.mat']);
        simFC = simFC.arr;
		simFC = squeeze(simFC);
		simFC = simFC(41:end,:); 
		simFC = downsample(simFC,4);
        simFC = corr(simFC);
       
        CiSim = modularity_finetune_und_sign(simFC);
        [VIn MIn] = partition_distance(CiSim,CiEmp);
        modMI_mat(i,j) = MIn;
    end
end    
        
        
        
    
  