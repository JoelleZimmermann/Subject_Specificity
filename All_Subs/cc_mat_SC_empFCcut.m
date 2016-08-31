% Like: cc_mat_simFC_empFC_petra.m, but cut off empTS when creating empFC..

% Compare SC-empFC individual predictivity matrix for all subs(48x48 matrix)
% cc_mat:
% 		EmpFC (i)
% SC (j)
%
%NOTE: For petras data, this script doesnt include QL_20120814 (orig 37th subject) and
%LG_20140324_1130 (orig 28th sub)
% Note: Petra's data: FC matrix sig tested, MC corrected, fisher z transformed. Corr on
% FC & SC taken on top triangle                                                                        %

addpath ~/Documents/Thesis/FC-and-SC-processing/
addpath ~/Software/Matlab/BCT/

% Removing some regions:
%a = [1:68];
%b = [31,32,65,66,5,39, 18,52,25,59,10,44,19,53,11,35,13,47,33,67]; % regions to remove
%regions = setdiff(a,b); 

% Petras alphabetical
%subsSC = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
%subsEmp = {'AA_20120815_fMRI_new.mat', 'AC_20120917_fMRI_new.mat', 'AR_20120813_fMRI_new.mat', 'AY_20111004_fMRI_new.mat', 'BQ_20120904_fMRI_new.mat', 'CN_20120927_fMRI_new.mat', 'DA_20120813_fMRI_new.mat', 'DG_20120903_fMRI_new.mat', 'DH_20120806_fMRI_new.mat', 'ER_20120816_fMRI_new.mat', 'EU_20120803_fMRI_new.mat', 'FE_20111010_fMRI_new.mat', 'FI_20120727_fMRI_new.mat', 'FJ_20120808_fMRI_new.mat', 'FR_20120903_fMRI_new.mat', 'GC_20120803_fMRI_new.mat', 'HA_20120813_fMRI_new.mat', 'IC_20120810_fMRI_new.mat', 'IQ_20120904_fMRI_new.mat', 'IS_20120809_fMRI_new.mat', 'JD_20120810_fMRI_new.mat', 'JH_20120925_fMRI_new.mat', 'JH_20121009_fMRI_new.mat', 'JL_20120927_fMRI_new.mat', 'JS_20120910_fMRI_new.mat', 'JZ_20120824_fMRI_new.mat', 'KI_20121009_fMRI_new.mat', 'NI_20120831_fMRI_new.mat', 'NN_20120824_fMRI_new.mat', 'NN_20120831_fMRI_new.mat', 'OG_20120917_fMRI_new.mat', 'OK_20121011_fMRI_new.mat', 'OQ_20120925_fMRI_new.mat', 'QL_20110925_fMRI_new.mat', 'QR_20111010_fMRI_new.mat', 'RF_20120809_fMRI_new.mat', 'RI_20110924_fMRI_new.mat', 'RI_20120815_fMRI_new.mat', 'RQ_20120903_fMRI_new.mat', 'RQ_20120917_fMRI_new.mat', 'RS_20120723_fMRI_new.mat', 'RT_20110925_fMRI_new.mat', 'SE_20110924_fMRI_new.mat', 'UB_20120806_fMRI_new.mat', 'UK_20110924_fMRI_new.mat', 'UK_20111004_fMRI_new.mat', 'XB_20120831_fMRI_new.mat', 'YE_20120910_fMRI_new.mat'};

% Petras age ordered:
%subsSC = {'AY_20111004_SC_new.mat', 'UB_20120806_SC.mat', 'IS_20120809_SC.mat', 'UK_20111004_SC_new.mat', 'IC_20120810_SC.mat', 'QR_20111010_SC_new.mat', 'RT_20110925_SC_new.mat', 'UK_20110924_SC_new.mat', 'FI_20120727_SC.mat', 'NI_20120831_SC.mat', 'FJ_20120808_SC.mat', 'XB_20120831_SC.mat', 'RI_20110924_SC_new.mat','GC_20120803_SC.mat', 'BQ_20120904_SC_new.mat', 'FE_20111010_SC_new.mat', 'QL_20110925_SC_new.mat', 'AA_20120815_SC.mat', 'DH_20120806_SC.mat', 'RI_20120815_SC.mat', 'RF_20120809_SC.mat', 'SE_20110924_SC_new.mat', 'RS_20120723_SC.mat', 'EU_20120803_SC.mat', 'ER_20120816_SC.mat', 'JD_20120810_SC.mat', 'JZ_20120824_SC.mat', 'DA_20120813_SC.mat', 'NN_20120824_SC.mat', 'JS_20120910_SC.mat', 'YE_20120910_SC.mat', 'RQ_20120917_SC.mat', 'FR_20120903_SC.mat', 'IQ_20120904_SC.mat', 'NN_20120831_SC.mat', 'RQ_20120903_SC.mat', 'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'JH_20120925_SC.mat', 'KI_20121009_SC.mat', 'OQ_20120925_SC.mat', 'JL_20120927_SC.mat', 'HA_20120813_SC.mat', 'CN_20120927_SC.mat', 'OK_20121011_SC.mat', 'DG_20120903_SC.mat', 'OG_20120917_SC.mat', 'JH_20121009_SC.mat'};
%subsEmp = {'AY_20111004_fMRI_new.mat', 'UB_20120806_fMRI_new.mat', 'IS_20120809_fMRI_new.mat', 'UK_20111004_fMRI_new.mat', 'IC_20120810_fMRI_new.mat', 'QR_20111010_fMRI_new.mat', 'RT_20110925_fMRI_new.mat', 'UK_20110924_fMRI_new.mat', 'FI_20120727_fMRI_new.mat', 'NI_20120831_fMRI_new.mat', 'FJ_20120808_fMRI_new.mat', 'XB_20120831_fMRI_new.mat', 'RI_20110924_fMRI_new.mat', 'GC_20120803_fMRI_new.mat', 'BQ_20120904_fMRI_new.mat', 'FE_20111010_fMRI_new.mat', 'QL_20110925_fMRI_new.mat', 'AA_20120815_fMRI_new.mat', 'DH_20120806_fMRI_new.mat', 'RI_20120815_fMRI_new.mat', 'RF_20120809_fMRI_new.mat', 'SE_20110924_fMRI_new.mat', 'RS_20120723_fMRI_new.mat', 'EU_20120803_fMRI_new.mat', 'ER_20120816_fMRI_new.mat', 'JD_20120810_fMRI_new.mat', 'JZ_20120824_fMRI_new.mat', 'DA_20120813_fMRI_new.mat', 'NN_20120824_fMRI_new.mat', 'JS_20120910_fMRI_new.mat', 'YE_20120910_fMRI_new.mat', 'RQ_20120917_fMRI_new.mat', 'FR_20120903_fMRI_new.mat', 'IQ_20120904_fMRI_new.mat', 'NN_20120831_fMRI_new.mat', 'RQ_20120903_fMRI_new.mat', 'AC_20120917_fMRI_new.mat', 'AR_20120813_fMRI_new.mat', 'JH_20120925_fMRI_new.mat', 'KI_20121009_fMRI_new.mat', 'OQ_20120925_fMRI_new.mat', 'JL_20120927_fMRI_new.mat', 'HA_20120813_fMRI_new.mat', 'CN_20120927_fMRI_new.mat', 'OK_20121011_fMRI_new.mat', 'DG_20120903_fMRI_new.mat', 'OG_20120917_fMRI_new.mat', 'JH_20121009_fMRI_new.mat'};

% Petras non-noisy data:
%subsSC = {'QR_20111010_SC_new.mat', 'RT_20110925_SC_new.mat', 'FJ_20120808_SC.mat', 'AA_20120815_SC.mat', 'DH_20120806_SC.mat', 'RI_20120815_SC.mat', 'RF_20120809_SC.mat', 'RS_20120723_SC.mat', 'EU_20120803_SC.mat', 'ER_20120816_SC.mat', 'RQ_20120917_SC.mat', 'FR_20120903_SC.mat'};
%subsEmp = {'QR_20111010_fMRI_new.mat', 'RT_20110925_fMRI_new.mat', 'FJ_20120808_fMRI_new.mat', 'AA_20120815_fMRI_new.mat', 'DH_20120806_fMRI_new.mat', 'RI_20120815_fMRI_new.mat', 'RF_20120809_fMRI_new.mat', 'RS_20120723_fMRI_new.mat', 'EU_20120803_fMRI_new.mat', 'ER_20120816_fMRI_new.mat', 'RQ_20120917_fMRI_new.mat', 'FR_20120903_fMRI_new.mat'};


% Petras age ordered from bwflav orig
%subsSC = {'AY_20111004_SC.mat', 'UB_20120806_SC.mat', 'IS_20120809_SC.mat', 'UK_20111004_SC.mat', 'IC_20120810_SC.mat', 'QR_20111010_SC.mat', 'RT_20110925_SC.mat', 'UK_20110924_SC.mat', 'FI_20120727_SC.mat', 'NI_20120831_SC.mat', 'FJ_20120808_SC.mat', 'XB_20120831_SC.mat', 'RI_20110924_SC.mat', 'GC_20120803_SC.mat', 'BQ_20120904_SC.mat', 'FE_20111010_SC.mat', 'QL_20110925_SC.mat', 'AA_20120815_SC.mat', 'DH_20120806_SC.mat', 'RI_20120815_SC.mat', 'RF_20120809_SC.mat', 'SE_20110924_SC.mat', 'RS_20120723_SC.mat', 'EU_20120803_SC.mat', 'ER_20120816_SC.mat', 'JD_20120810_SC.mat', 'JZ_20120824_SC.mat', 'DA_20120813_SC.mat', 'NN_20120824_SC.mat', 'JS_20120910_SC.mat', 'YE_20120910_SC.mat', 'RQ_20120917_SC.mat', 'FR_20120903_SC.mat', 'IQ_20120904_SC.mat', 'NN_20120831_SC.mat', 'RQ_20120903_SC.mat', 'AC_20120917_SC.mat', 'AR_20120813_SC.mat', 'JH_20120925_SC.mat', 'KI_20121009_SC.mat', 'OQ_20120925_SC.mat', 'JL_20120927_SC.mat', 'HA_20120813_SC.mat', 'CN_20120927_SC.mat', 'OK_20121011_SC.mat', 'DG_20120903_SC.mat', 'OG_20120917_SC.mat', 'JH_20121009_SC.mat'};
%subsEmp = {'AY_20111004_fMRI_new.mat', 'UB_20120806_fMRI_new.mat', 'IS_20120809_fMRI_new.mat', 'UK_20111004_fMRI_new.mat', 'IC_20120810_fMRI_new.mat', 'QR_20111010_fMRI_new.mat', 'RT_20110925_fMRI_new.mat', 'UK_20110924_fMRI_new.mat', 'FI_20120727_fMRI_new.mat', 'NI_20120831_fMRI_new.mat', 'FJ_20120808_fMRI_new.mat', 'XB_20120831_fMRI_new.mat', 'RI_20110924_fMRI_new.mat', 'GC_20120803_fMRI_new.mat', 'BQ_20120904_fMRI_new.mat', 'FE_20111010_fMRI_new.mat', 'QL_20110925_fMRI_new.mat', 'AA_20120815_fMRI_new.mat', 'DH_20120806_fMRI_new.mat', 'RI_20120815_fMRI_new.mat', 'RF_20120809_fMRI_new.mat', 'SE_20110924_fMRI_new.mat', 'RS_20120723_fMRI_new.mat', 'EU_20120803_fMRI_new.mat', 'ER_20120816_fMRI_new.mat', 'JD_20120810_fMRI_new.mat', 'JZ_20120824_fMRI_new.mat', 'DA_20120813_fMRI_new.mat', 'NN_20120824_fMRI_new.mat', 'JS_20120910_fMRI_new.mat', 'YE_20120910_fMRI_new.mat', 'RQ_20120917_fMRI_new.mat', 'FR_20120903_fMRI_new.mat', 'IQ_20120904_fMRI_new.mat', 'NN_20120831_fMRI_new.mat', 'RQ_20120903_fMRI_new.mat', 'AC_20120917_fMRI_new.mat', 'AR_20120813_fMRI_new.mat', 'JH_20120925_fMRI_new.mat', 'KI_20121009_fMRI_new.mat', 'OQ_20120925_fMRI_new.mat', 'JL_20120927_fMRI_new.mat', 'HA_20120813_fMRI_new.mat', 'CN_20120927_fMRI_new.mat', 'OK_20121011_fMRI_new.mat', 'DG_20120903_fMRI_new.mat', 'OG_20120917_fMRI_new.mat', 'JH_20121009_fMRI_new.mat'};

%NKI Rockland data:
%subsSC = {'9780496', '9716792', '9645370', '9630905', '9537916', '9536886', '9421819', '9100911', '9006154', '8735778', '8691891', '8628499', '8574662', '7212617', '7055197', '6913939', '6709880', '6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'}; % ..'6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'};
%subsEmp = {'9780496', '9716792', '9645370', '9630905', '9537916', '9536886', '9421819', '9100911', '9006154', '8735778', '8691891', '8628499', '8574662', '7212617', '7055197', '6913939', '6709880', '6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'}; % ..'6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'};

%UCLA Autism data:
%subsSC = {'145', '144', '143', '142', '140_CCN', '139_CCN', '138_CCN', '137', '136_CCN', '135', '134_CCN', '133B_CCN', '132_CCN', '131B', '130B', '128B', '126B', '125B', '124B', '123B', '122B', '120B', '118B', '114B', '113B', '112B', '111B', '108B', '107B', '105B', '103', '102B', '101', '100B', '86C'};
%subsEmp = {'145', '144', '143', '142', '140_CCN', '139_CCN', '138B_CCN', '137', '136_CCN', '135', '134_CCN', '133_CCN', '132_CCN', '131', '130B', '128', '126', '125', '124', '123', '122', '120', '118', '114', '113B', '112B', '111B', '108B', '107B', '105', '103B', '102B', '101B', '100C', '86C'};

%Soccer player data:
%load('/Users/jzimmermann/Documents/PHD_Thesis/Soccer_Player/SC_orderer.mat')
%subsSC = 1:size(c_weight,3); 
%load('/Users/jzimmermann/Documents/PHD_Thesis/Soccer_Player/emp_FC.mat')
%subsEmp = 1:size(controls,3); 

%Motor data:
subsSC = {'AJ_20140516_1600', 'BR_20140404_1600', 'CN_20140319_1600', 'DL_20140415_1000', 'EH_20140428_1500', 'EK_20140506_1600', 'FG_20140520_1400', 'GD_20140429_1700', 'GI_20140414_1300', 'GQ_20140408_1500', 'IZ_20140414_1000', 'JL_20140324_1300', 'JM_20140415_1600', 'LO_20140407_1700', 'LQ_20140428_1200', 'LR_20140411', 'ML_20140404_1400', 'MZ_20140407_1400', 'QD_20140516_1600', 'QH_20140307_1400', 'QH_20140516_1530', 'QJ_20140505_1700', 'QR_20140404_1000', 'RE_20140408_1330', 'SG_20140414_1600', 'UF_20140411_1000', 'VF_20140512_0900', 'YZ_20140414_1100'};
subsEmp = {'AJ_20140516_1600', 'BR_20140404_1600', 'CN_20140319_1600', 'DL_20140415_1000', 'EH_20140428_1500', 'EK_20140506_1600', 'FG_20140520_1400', 'GD_20140429_1700', 'GI_20140414_1300', 'GQ_20140408_1500', 'IZ_20140414_1000', 'JL_20140324_1300', 'JM_20140415_1600', 'LO_20140407_1700', 'LQ_20140428_1200', 'LR_20140411', 'ML_20140404_1400', 'MZ_20140407_1400', 'QD_20140516_1600', 'QH_20140307_1400', 'QH_20140516_1530', 'QJ_20140505_1700', 'QR_20140404_1000', 'RE_20140408_1330', 'SG_20140414_1600', 'UF_20140411_1000', 'VF_20140512_0900', 'YZ_20140414_1100'};

cc_mat = zeros(length(subsSC),length(subsSC)); %corrs of SC w FC
cc_mat_dists = zeros(length(subsSC),length(subsSC)); %corrs of dist corr SC (residuals) w FC
cc_mat_dists_p = zeros(length(subsSC),length(subsSC));
cc_mat_p = zeros(length(subsSC),length(subsSC));
cc_mat_gaus = zeros(length(subsSC),length(subsSC)); %corrs of resampled SC w FC
cc_mat_gaus_p = zeros(length(subsSC),length(subsSC));
max_eigen_mat = zeros(length(subsSC),length(subsSC));
mean_eigen_mat = zeros(length(subsSC),length(subsSC));

for i= 1:length(subsEmp) 

    %Petras data:
    %empTS = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/' subsEmp{i}]);
    %empTS = empTS.fmriTS;
    %[empFC] = MultipleCompFDR(empTS); % creates FC matrix from time series, sig tested & MC corrected, fisher z transformed
        %empFC = threshold_proportional(empFC, .8);
    
    %NKI Rockland data:
    %empFC = load(['/Users/jzimmermann/Documents/PHD_Thesis/NKI_Rockland/' subsEmp{i} '_fcMRI_noGSR_connectivity_matrix_file.txt']);
    %empFC = abs(empFC);
    
    %UCLA Autism data:
    %empFC = load(['/Users/jzimmermann/Documents/PHD_Thesis/UCLA_Autism/TD' subsEmp{i} '_rsfMRI_connectivity_matrix_file.txt']);
    
    %Soccer player data:
    %empFC = controls(:,:,i);
    
    %Motor data:
    empFC = load(['/Users/jzimmermann/Documents/Motor_Task/Data_All/' subsEmp{i} '_fMRI_1.mat']); ROI_ID_table = empFC.ROI_ID_table; empFC = empFC.FC_cc;
    start1 = size(ROI_ID_table,1)-68; stop1 = start1+34-1; start2 = stop1+2; stop2 =size(ROI_ID_table,1);
    empFC = empFC([start1:stop1, start2:stop2],[start1:stop1, start2:stop2]);
    
    %empFC = empFC(regions, regions); %to resize without noisy regions
        %empFC = empFC(1:34,1:34);
    empFC(empFC==Inf) = 1;  
    empFC(isnan(empFC)) = 1;
    indexe= triu(true(size(empFC)),1); 
    %indexe = std_SCM3D>.1; %only consider conn with high var across subs
    empFC_reshaped = empFC(indexe);
    
    % Compute PCA on empFC:
    [COEFF_e,latent_e,explained_e] = pcacov(empFC);
    emp_PCs = COEFF_e(:,1:10);
    
    for j=1:length(subsSC) 
        
        %Petras data:
        %SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subsSC{j} '/weights.txt']);
        %dist = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subsSC{j} '/tract_lengths.txt']);
            %SC = SC(1:34,1:34);
            %dist = dist(1:34,1:34);
            %SC = threshold_proportional(SC, .8);
        
        %Petras bwflav from orig:
        %SC = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/' subsSC{j}]);
        %SC = SC.SC_cap_agg_bwflav2;
        
        %NKI Rockland data:
        %SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/NKI_Rockland/' subsSC{j} '_DTI_connectivity_matrix_file.txt']);
        %SC = log10(SC+1); %norm Rockland data
        %SC = SC/(max(max(SC)));
    
        %UCLA Autism data:
        %SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/UCLA_Autism/TD' subsSC{j} '_DTI_connectivity_matrix_file.txt']);
        %SC = log10(SC+1); %norm Autism data
        %SC = SC/(max(max(SC)));
        %rsfmri_to_dti_mapping=load('~/Documents/PHD_Thesis/UCLA_Autism/UCLA_Autism_rsfmri_to_dti_node_mapping.txt');
        %rsfmri_to_dti_mapping = rsfmri_to_dti_mapping +1;
        %SC=SC(rsfmri_to_dti_mapping,rsfmri_to_dti_mapping);
        
        %Soccer player data:
        %SC = c_weight(:,:,j);
        
        %Motor data:
        SC = load(['/Users/jzimmermann/Documents/Motor_Task/Data_All/' subsSC{j} '_SC.mat']); 
        dist = SC.SC_dist_mean_agg; SC = SC.SC_cap_agg_bwflav1_norm;
        
        %SC = SC(regions, regions);
        %SC(SC>0)=1; %binarize 
        indexsc = triu(true(size(SC)),1); 
        %indexsc = std_SCM3D>.1;
        SC_reshaped = SC(indexsc);
        
        % Compute PCA on empFC:
        [COEFF_s,latent_s,explained_s] = pcacov(SC);
        sc_PCs = COEFF_s(:,1:10);
        
        %Distance residuals:
        %dist = dist(regions, regions);
        indexd = triu(true(size(dist)),1);
        dist_reshaped = dist(indexd);
        [B,BINT,R] = regress(SC_reshaped,dist_reshaped);
        
        [RHOd,PVALd] = corr(R, empFC_reshaped);
        cc_mat_dists(j,i) = RHOd;
        cc_mat_dists_p(j,i) = PVALd;
        
        % Resample SCs to Gaussian:
        SC_Gaussian = Resample_to_Gaussian(SC);
        SC_Gaussian_reshaped = SC_Gaussian(indexsc);
        [RHO,PVAL] = corr(SC_Gaussian_reshaped,empFC_reshaped);
        cc_mat_gaus(j,i) = RHO;
        cc_mat_gaus_p (j,i) = PVAL;    
        
        [RHO,PVAL] = corr(SC_reshaped,empFC_reshaped);
        cc_mat(j,i) = RHO;
        cc_mat_p(j,i) = PVAL;
        
        % PCA SimFC-EmpFC corr:
        eigenvector_corrs = corr(emp_PCs, sc_PCs); % 10*10 corrs btw eigenvectors of empFC and of SC
        max_eigenvector_corrs = max(eigenvector_corrs,[],2); % max along each emp_PC eigenvector corr
        mean_eigen_mat(j,i) = mean(max_eigenvector_corrs); %given 10 biggest eigenvector corrs for each emp_PC, take the mean of the 10
        max_eigen_mat(j,i) = max(max_eigenvector_corrs); %%given 10 biggest eigenvector corrs for each emp_PC, take the max of the 10
        
    end
end

%%%% T-test on cc_mat %%%%
% To get mean of top triangle:
indexu= triu(true(size(cc_mat)),1);
top_tri = cc_mat(indexu);
mean_top_tri = mean(top_tri)
% To get mean of bottom triangle:
indexl= tril(true(size(cc_mat)),-1);
bottom_tri = cc_mat(indexl);
mean_bottom_tri = mean(bottom_tri)
% To get mean of diag:
diag_elements = diag(cc_mat);
mean_diag = mean(diag_elements)
% T-Test to evaluate if difference is significant:
H = ttest2(bottom_tri, diag_elements) % *insig!
H = ttest2(top_tri, diag_elements) % *insig!

%%%% T-test on max_eigen_mat %%%%
% To get mean of top triangle:
top_tri_eigen = max_eigen_mat(indexu);
mean_top_tri_eigen = mean(top_tri_eigen)
% To get mean of bottom triangle:
bottom_tri_eigen = max_eigen_mat(indexl);
mean_bottom_tri_eigen = mean(bottom_tri_eigen)
% To get mean of diag:
diag_elements_eigen = diag(max_eigen_mat);
mean_diag = mean(diag_elements_eigen)
% T-Test to evaluate if difference is significant:
H = ttest2(bottom_tri_eigen, diag_elements_eigen) 
H = ttest2(top_tri_eigen, diag_elements_eigen) 


%%%%% Figure of cc_mat and max_eigen_mat %%%%
figure(1);
imagesc(cc_mat);
xlabel('FC', 'fontsize', 20);
ylabel('SC', 'fontsize', 20);
c = colorbar;
ylabel(c, 'SC-FC corrs', 'fontsize', 20);
set(gcf,'color','w');
print -dtiff -r600 /Users/jzimmermann/Documents/Publications/Individual-SC-FC/Figures/cc_mat.tiff;

figure(2);
imagesc(max_eigen_mat);
xlabel('FC', 'fontsize', 20);
ylabel('SC', 'fontsize', 20);
c = colorbar;
ylabel(c, 'SC-FC PC corrs', 'fontsize', 20);
set(gcf,'color','w');
print -dtiff -r600 /Users/jzimmermann/Documents/Publications/Individual-SC-FC/Figures/max_eigen_mat.tiff;

%%%%% Histogram of ondiags (selfSC-FC), and offdiags (otherSC-FC) %%%%
cd /Users/jzimmermann/Documents/PHD_Thesis/Subject_Specificity/All_Subs/
Plotting_Dists