% Like: cc_mat_simFC_empFC_petra.m, but cut off empTS when creating empFC..

% Compare SC-empFC individual predictivity matrix for all subs
%
% cc_mat:
% 		EmpFC (i)
% SC (j)
%
%NOTE: For petras data, this script doesnt include QL_20120814 (orig 37th subject) and
%LG_20140324_1130 (orig 28th sub)
% Note: Petra's data: FC matrix sig tested, MC corrected, fisher z transformed. Corr on
% FC & SC taken on top triangle                                                                                  %

addpath ~/Documents/Thesis/FC-and-SC-processing/

% Petras alphabetical
%subsSC = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
%subsEmp = {'AA_20120815_fMRI_new.mat', 'AC_20120917_fMRI_new.mat', 'AR_20120813_fMRI_new.mat', 'AY_20111004_fMRI_new.mat', 'BQ_20120904_fMRI_new.mat', 'CN_20120927_fMRI_new.mat', 'DA_20120813_fMRI_new.mat', 'DG_20120903_fMRI_new.mat', 'DH_20120806_fMRI_new.mat', 'ER_20120816_fMRI_new.mat', 'EU_20120803_fMRI_new.mat', 'FE_20111010_fMRI_new.mat', 'FI_20120727_fMRI_new.mat', 'FJ_20120808_fMRI_new.mat', 'FR_20120903_fMRI_new.mat', 'GC_20120803_fMRI_new.mat', 'HA_20120813_fMRI_new.mat', 'IC_20120810_fMRI_new.mat', 'IQ_20120904_fMRI_new.mat', 'IS_20120809_fMRI_new.mat', 'JD_20120810_fMRI_new.mat', 'JH_20120925_fMRI_new.mat', 'JH_20121009_fMRI_new.mat', 'JL_20120927_fMRI_new.mat', 'JS_20120910_fMRI_new.mat', 'JZ_20120824_fMRI_new.mat', 'KI_20121009_fMRI_new.mat', 'NI_20120831_fMRI_new.mat', 'NN_20120824_fMRI_new.mat', 'NN_20120831_fMRI_new.mat', 'OG_20120917_fMRI_new.mat', 'OK_20121011_fMRI_new.mat', 'OQ_20120925_fMRI_new.mat', 'QL_20110925_fMRI_new.mat', 'QR_20111010_fMRI_new.mat', 'RF_20120809_fMRI_new.mat', 'RI_20110924_fMRI_new.mat', 'RI_20120815_fMRI_new.mat', 'RQ_20120903_fMRI_new.mat', 'RQ_20120917_fMRI_new.mat', 'RS_20120723_fMRI_new.mat', 'RT_20110925_fMRI_new.mat', 'SE_20110924_fMRI_new.mat', 'UB_20120806_fMRI_new.mat', 'UK_20110924_fMRI_new.mat', 'UK_20111004_fMRI_new.mat', 'XB_20120831_fMRI_new.mat', 'YE_20120910_fMRI_new.mat'};

% Petras Age ordered:
subsSC = {'AY_20111004_SC_new.mat', 'UB_20120806_SC.mat', 'IS_20120809_SC.mat', 'UK_20111004_SC_new.mat', 'IC_20120810_SC.mat', 'QR_20111010_SC_new.mat', 'RT_20110925_SC_new.mat', 'UK_20110924_SC_new.mat', 'FI_20120727_SC.mat', 'NI_20120831_SC.mat', 'FJ_20120808_SC.mat', 'XB_20120831_SC.mat', 'RI_20110924_SC_new.mat' 'GC_20120803_SC.mat', 'BQ_20120904_SC_new.mat', 'FE_20111010_SC_new.mat', 'QL_20110925_SC_new.mat', 'AA_20120815_SC.mat', 'DH_20120806_SC.mat', 'RI_20120815_SC.mat', 'RF_20120809_SC.mat', 'SE_20110924_SC_new.mat', 'RS_20120723_SC.mat', 'EU_20120803_SC.mat', 'ER_20120816_SC.mat', 'JD_20120810_SC.mat', 'JZ_20120824_SC.mat', 'DA_20120813_SC.mat', 'NN_20120824_SC.mat', 'JS_20120910_SC.mat', 'YE_20120910_SC.mat', 'RQ_20120917_SC.mat', 'FR_20120903_SC.mat', 'IQ_20120904_SC.mat', 'NN_20120831_SC.mat', 'RQ_20120903_SC.mat', 'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'JH_20120925_SC.mat', 'KI_20121009_SC.mat', 'OQ_20120925_SC.mat', 'JL_20120927_SC.mat', 'HA_20120813_SC.mat', 'CN_20120927_SC.mat', 'OK_20121011_SC.mat', 'DG_20120903_SC.mat', 'OG_20120917_SC.mat', 'JH_20121009_SC.mat'};
subsEmp = {'AY_20111004_fMRI_new.mat', 'UB_20120806_fMRI_new.mat', 'IS_20120809_fMRI_new.mat', 'UK_20111004_fMRI_new.mat', 'IC_20120810_fMRI_new.mat', 'QR_20111010_fMRI_new.mat', 'RT_20110925_fMRI_new.mat', 'UK_20110924_fMRI_new.mat', 'FI_20120727_fMRI_new.mat', 'NI_20120831_fMRI_new.mat', 'FJ_20120808_fMRI_new.mat', 'XB_20120831_fMRI_new.mat', 'RI_20110924_fMRI_new.mat', 'GC_20120803_fMRI_new.mat', 'BQ_20120904_fMRI_new.mat', 'FE_20111010_fMRI_new.mat', 'QL_20110925_fMRI_new.mat', 'AA_20120815_fMRI_new.mat', 'DH_20120806_fMRI_new.mat', 'RI_20120815_fMRI_new.mat', 'RF_20120809_fMRI_new.mat', 'SE_20110924_fMRI_new.mat', 'RS_20120723_fMRI_new.mat', 'EU_20120803_fMRI_new.mat', 'ER_20120816_fMRI_new.mat', 'JD_20120810_fMRI_new.mat', 'JZ_20120824_fMRI_new.mat', 'DA_20120813_fMRI_new.mat', 'NN_20120824_fMRI_new.mat', 'JS_20120910_fMRI_new.mat', 'YE_20120910_fMRI_new.mat', 'RQ_20120917_fMRI_new.mat', 'FR_20120903_fMRI_new.mat', 'IQ_20120904_fMRI_new.mat', 'NN_20120831_fMRI_new.mat', 'RQ_20120903_fMRI_new.mat', 'AC_20120917_fMRI_new.mat', 'AR_20120813_fMRI_new.mat', 'JH_20120925_fMRI_new.mat', 'KI_20121009_fMRI_new.mat', 'OQ_20120925_fMRI_new.mat', 'JL_20120927_fMRI_new.mat', 'HA_20120813_fMRI_new.mat', 'CN_20120927_fMRI_new.mat', 'OK_20121011_fMRI_new.mat', 'DG_20120903_fMRI_new.mat', 'OG_20120917_fMRI_new.mat', 'JH_20121009_fMRI_new.mat'};

%NKI Rockland data:
%subsSC = {'9780496', '9716792', '9645370', '9630905', '9537916', '9536886', '9421819', '9100911', '9006154', '8735778', '8691891', '8628499', '8574662', '7212617', '7055197', '6913939', '6709880', '6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'}; % ..'6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'};
%subsEmp = {'9780496', '9716792', '9645370', '9630905', '9537916', '9536886', '9421819', '9100911', '9006154', '8735778', '8691891', '8628499', '8574662', '7212617', '7055197', '6913939', '6709880', '6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'}; % ..'6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'};


%UCLA Autism data:
%subsSC = {'145', '144', '143', '142', '140_CCN', '139_CCN', '138_CCN', '137', '136_CCN', '135', '134_CCN', '133B_CCN', '132_CCN', '131B', '130B', '128B', '126B', '125B', '124B', '123B', '122B', '120B', '118B', '114B', '113B', '112B', '111B', '108B', '107B', '105B', '103', '102B', '101', '100B', '86C'};
%subsEmp = {'145', '144', '143', '142', '140_CCN', '139_CCN', '138B_CCN', '137', '136_CCN', '135', '134_CCN', '133_CCN', '132_CCN', '131', '130B', '128', '126', '125', '124', '123', '122', '120', '118', '114', '113B', '112B', '111B', '108B', '107B', '105', '103B', '102B', '101B', '100C', '86C'};

cc_mat = zeros(length(subsSC),length(subsSC));

for i= 1:length(subsEmp) 

    %Petras data:
    empTS = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/' subsEmp{i}]);
    empTS = empTS.fmriTS;
    [empFC] = MultipleCompFDR(empTS); % creates FC matrix from time series, sig tested & MC corrected, fisher z transformed
    
    %NKI Rockland data:
    %empFC = load(['/Users/jzimmermann/Documents/PHD_Thesis/NKI_Rockland/' subsEmp{i} '_fcMRI_noGSR_connectivity_matrix_file.txt']);
    %empFC(logical(eye(size(empFC)))) = 1;
    %empFC = abs(empFC);
    
    %UCLA Autism data:
    %empFC = load(['/Users/jzimmermann/Documents/PHD_Thesis/UCLA_Autism/TD' subsEmp{i} '_rsfMRI_connectivity_matrix_file.txt']);
    %empFC(logical(eye(size(empFC)))) = 1;
    %empFC = abs(empFC);
    
    for j=1:length(subsSC) 
        
        %Petras data:
        SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subsSC{j} '/weights.txt']);
        
        %NKI Rockland data:
        %SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/NKI_Rockland/' subsSC{j} '_DTI_connectivity_matrix_file.txt']);
        %SC = log10(SC+1); %norm Rockland data (otherwise comment out)
        %SC = SC/(max(max(SC))); %norm Rockland data (otherwise comment out)
        
        %UCLA Autism data:
        %SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/UCLA_Autism/TD' subsSC{j} '_DTI_connectivity_matrix_file.txt']);
        %SC = log10(SC+1); %norm Autism data
        %SC = SC/(max(max(SC)));
        %rsfmri_to_dti_mapping=load('~/Documents/PHD_Thesis/UCLA_Autism/UCLA_Autism_rsfmri_to_dti_node_mapping.txt');
        %rsfmri_to_dti_mapping = rsfmri_to_dti_mapping +1;
        %SC=SC(rsfmri_to_dti_mapping,rsfmri_to_dti_mapping);
        
        SC(logical(eye(size(SC)))) = 0;
        cc_mat(j,i) = SC_FC_Corrs_SC_PresentMat(empFC, SC);
    end
end