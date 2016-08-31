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
subs = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'LG_20140324_1130_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QL_20120814_SC.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
modMI_mat = zeros(50,50); 
modMI_mat_SC_SimFC = zeros(50,50);
modMI_mat_SC_EmpFC = zeros(50,50);
fields = fieldnames(ALL);

for i = 1:50
for j = 1:50

	empFC = ALL.(fields{i}).empFC;
	simFC = ALL.(fields{j}).highest_CC_simFC;
    SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subs{i} '/weights.txt']);
    
    % Modularity, also tried community_louvain (needs + input),
    % modularity_louvian_und_sign
    CiEmp = modularity_finetune_und_sign(empFC);
    CiSim = modularity_finetune_und_sign(simFC);
    CiSC = modularity_finetune_und_sign(SC);
    
    [VIn MIn] = partition_distance(CiSim,CiEmp);
    [VIn_SC_SimFC MIn_SC_SimFC] = partition_distance(CiSim,CiSC);
    [VIn_SC_EmpFC MIn_SC_EmpFC] = partition_distance(CiEmp,CiSC);
    
	modMI_mat(i,j) = MIn;
    modMI_mat_SC_SimFC(i,j) = MIn_SC_SimFC;
    modMI_mat_SC_EmpFC(i,j) = MIn_SC_EmpFC;
   
end
end

% To get mean of top triangle:  
indexu= triu(true(size(modMI_mat)),1);
top_tri = modMI_mat(indexu);
mean_toptri = mean(top_tri)

% To get mean of bottom triangle:  
indexl= tril(true(size(modMI_mat)),-1);
bottom_tri = modMI_mat(indexl);
mean_bottomtri = mean(bottom_tri)

% To get mean of diag: 
diag_elements = diag(modMI_mat);
mean_diag = mean(diag_elements)

% T-Test to evaluate if difference is significant:
H_mod_mat = ttest2(bottom_tri, diag_elements) % insig!
H_mod_mat = ttest2(top_tri, diag_elements) % insig!
