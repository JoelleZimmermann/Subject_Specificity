% Sliding window across the EmpTS, each time create EmpFC, and corr this
% time-windowed EmpFC with SC. Take mean of SC-EmpFC corrs across all
% windows. Create individual predictivity matrix of all subs SC-EmpFC corrs
% across all EmpTS windows.
%
% Variables of Interest:
%   SC_FC_corrs: a list of corrs of averaged SC-EmpFC corrs across all time
%   windows. # of corrs will = # of EmpFC windows
%
% Output:
%   corr_mat: corrs of SC-EmpFC with sub's SC matrices along cols (i), and
%   sub's EmpFC matrices along rows (j)


function [corr_mat] = SC_EmpFC_SlidingWin()
    
    addpath /Users/jzimmermann/Documents/PHD_Thesis/Python_stuff/My_tvb/Subject_Specificity; % path to TS_To_FC_Per_Window

    corr_mat = zeros(48,48);
    subsSC = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};    
    subsEmp = {'AA_20120815_fMRI_new.mat', 'AC_20120917_fMRI_new.mat', 'AR_20120813_fMRI_new.mat', 'AY_20111004_fMRI_new.mat', 'BQ_20120904_fMRI_new.mat', 'CN_20120927_fMRI_new.mat', 'DA_20120813_fMRI_new.mat', 'DG_20120903_fMRI_new.mat', 'DH_20120806_fMRI_new.mat', 'ER_20120816_fMRI_new.mat', 'EU_20120803_fMRI_new.mat', 'FE_20111010_fMRI_new.mat', 'FI_20120727_fMRI_new.mat', 'FJ_20120808_fMRI_new.mat', 'FR_20120903_fMRI_new.mat', 'GC_20120803_fMRI_new.mat', 'HA_20120813_fMRI_new.mat', 'IC_20120810_fMRI_new.mat', 'IQ_20120904_fMRI_new.mat', 'IS_20120809_fMRI_new.mat', 'JD_20120810_fMRI_new.mat', 'JH_20120925_fMRI_new.mat', 'JH_20121009_fMRI_new.mat', 'JL_20120927_fMRI_new.mat', 'JS_20120910_fMRI_new.mat', 'JZ_20120824_fMRI_new.mat', 'KI_20121009_fMRI_new.mat', 'NI_20120831_fMRI_new.mat', 'NN_20120824_fMRI_new.mat', 'NN_20120831_fMRI_new.mat', 'OG_20120917_fMRI_new.mat', 'OK_20121011_fMRI_new.mat', 'OQ_20120925_fMRI_new.mat', 'QL_20110925_fMRI_new.mat', 'QR_20111010_fMRI_new.mat', 'RF_20120809_fMRI_new.mat', 'RI_20110924_fMRI_new.mat', 'RI_20120815_fMRI_new.mat', 'RQ_20120903_fMRI_new.mat', 'RQ_20120917_fMRI_new.mat', 'RS_20120723_fMRI_new.mat', 'RT_20110925_fMRI_new.mat', 'SE_20110924_fMRI_new.mat', 'UB_20120806_fMRI_new.mat', 'UK_20110924_fMRI_new.mat', 'UK_20111004_fMRI_new.mat', 'XB_20120831_fMRI_new.mat', 'YE_20120910_fMRI_new.mat'};
    %NOTE: subsEmp (and subsSC) doesnt include QL_20120814 and LG_20140324_1130
    
     %corr_mat = zeros(6,6);
     %subsSC = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat'};
     %subsEmp = {'AA_20120815_fMRI_new.mat', 'AC_20120917_fMRI_new.mat', 'AR_20120813_fMRI_new.mat', 'AY_20111004_fMRI_new.mat', 'BQ_20120904_fMRI_new.mat', 'CN_20120927_fMRI_new.mat'};
    
    for i = 1:length(subsSC) % index of SC. Loop thru SC, fix on one, go into its simFCs in following loop
        SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subsSC{i} '/weights.txt']);
        SC = reshape(SC, 68*68,1);

        for j= 1:48 % loop thru EmpFCs, first fix on EmpFC of subj1 
            EmpTS = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/' subsEmp{j}]);
            EmpTS = EmpTS.fmriTS;
    
            [ FC3D_Per_Window_empTS ] = TS_To_FC_Per_Window( EmpTS, 1940, 600000, 1 ); %TS, sampling period in ms, window size in ms, step size in time points
            SC_FC_corrs = [];
            for m = 1:size(FC3D_Per_Window_empTS,3) 
                SC_FC_corrs(end+1) = corr(SC, reshape(FC3D_Per_Window_empTS(:,:,m), 68*68,1));
            end
            SC_FC_corr = max(SC_FC_corrs);
            
            corr_mat(j,i) = SC_FC_corr;
        end
    end    
    
        
    
    
    
    
    