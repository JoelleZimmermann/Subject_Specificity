% Check modularity in SC's. Do networks with high SC modularity have higher
% SC-simFC corrs, and higher SC-empFC corrs?
%
% QSCs is a vector of 50 Q vals (1 per subj), each represents strength of modularity in SC
% cc_SC_EmpFC is a vector of 50 corrs - btw SC and EmpFC
% cc_SC_SimFC is a vector of 50 corrs - btw SC and SimFC (ideal SimFC)

addpath ~/Software/Matlab/BCT
subs = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'LG_20140324_1130_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QL_20120814_SC.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
QSCs = [];
fields = fieldnames(ALL);
cc_SC_EmpFC = [];
cc_SC_SimFC = [];

for i=1:length(subs)
    SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subs{i} '/weights.txt']);
    [CiSC, QSC] = modularity_und(SC); % modularity_louvain_und_sign
    QSCs(end+1) = QSC;
    
    EmpFC = ALL.(fields{i}).empFC; 
    SimFC = ALL.(fields{i}).highest_CC_simFC;
    
    cc_SC_EmpFC(end+1) = corr(reshape(EmpFC,68*68,1), reshape(SC,68*68,1));
    cc_SC_SimFC(end+1) = corr(reshape(SimFC,68*68,1), reshape(SC,68*68,1));
end   

[rho_SC_EmpFC,pval_SC_EmpFC] = corr(reshape(cc_SC_EmpFC, 50, 1), reshape(QSCs,50,1)); % Not sig using modularity_louvain_und_sign- highly modular SCs don't predict better the empFC, p = .1, corr = ~.25 (higher SC modularity means lower SC-EmpFC corrs)
[rho_SC_SimFC,pval_SC_SimFC] = corr(reshape(cc_SC_SimFC, 50, 1), reshape(QSCs,50,1)); % Not sig using modularity_louvain_und_sign- close - pval = .06, corr = ~-.25 (high SC modularity means lower SC-SimFC corrs)

% NOTE: BOTH ARE SIG USING MODULARITY_UND!!! BUT HIGH SC MOD PREDICTS LOWER
% SC-FC CORRS.??

 