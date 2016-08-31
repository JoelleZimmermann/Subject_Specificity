% Individual predictivity matrix for FC's (ie corr FC1 with FC1, FC2, FC3, FC4)

addpath ~/Documents/Thesis/FC-and-SC-processing/

%Petras data:
%subsEmp = {'AA_20120815_fMRI_new.mat', 'AC_20120917_fMRI_new.mat', 'AR_20120813_fMRI_new.mat', 'AY_20111004_fMRI_new.mat', 'BQ_20120904_fMRI_new.mat', 'CN_20120927_fMRI_new.mat', 'DA_20120813_fMRI_new.mat', 'DG_20120903_fMRI_new.mat', 'DH_20120806_fMRI_new.mat', 'ER_20120816_fMRI_new.mat', 'EU_20120803_fMRI_new.mat', 'FE_20111010_fMRI_new.mat', 'FI_20120727_fMRI_new.mat', 'FJ_20120808_fMRI_new.mat', 'FR_20120903_fMRI_new.mat', 'GC_20120803_fMRI_new.mat', 'HA_20120813_fMRI_new.mat', 'IC_20120810_fMRI_new.mat', 'IQ_20120904_fMRI_new.mat', 'IS_20120809_fMRI_new.mat', 'JD_20120810_fMRI_new.mat', 'JH_20120925_fMRI_new.mat', 'JH_20121009_fMRI_new.mat', 'JL_20120927_fMRI_new.mat', 'JS_20120910_fMRI_new.mat', 'JZ_20120824_fMRI_new.mat', 'KI_20121009_fMRI_new.mat', 'NI_20120831_fMRI_new.mat', 'NN_20120824_fMRI_new.mat', 'NN_20120831_fMRI_new.mat', 'OG_20120917_fMRI_new.mat', 'OK_20121011_fMRI_new.mat', 'OQ_20120925_fMRI_new.mat', 'QL_20110925_fMRI_new.mat', 'QR_20111010_fMRI_new.mat', 'RF_20120809_fMRI_new.mat', 'RI_20110924_fMRI_new.mat', 'RQ_20120903_fMRI_new.mat', 'RQ_20120917_fMRI_new.mat', 'RS_20120723_fMRI_new.mat', 'RT_20110925_fMRI_new.mat', 'SE_20110924_fMRI_new.mat', 'UB_20120806_fMRI_new.mat', 'UK_20110924_fMRI_new.mat', 'UK_20111004_fMRI_new.mat', 'XB_20120831_fMRI_new.mat', 'YE_20120910_fMRI_new.mat'};
%Age ordered:
subsEmp = {'AY_20111004_fMRI_new.mat', 'UB_20120806_fMRI_new.mat', 'IS_20120809_fMRI_new.mat', 'UK_20111004_fMRI_new.mat', 'IC_20120810_fMRI_new.mat', 'QR_20111010_fMRI_new.mat', 'RT_20110925_fMRI_new.mat', 'UK_20110924_fMRI_new.mat', 'FI_20120727_fMRI_new.mat', 'NI_20120831_fMRI_new.mat', 'FJ_20120808_fMRI_new.mat', 'XB_20120831_fMRI_new.mat', 'RI_20110924_fMRI_new.mat', 'GC_20120803_fMRI_new.mat', 'BQ_20120904_fMRI_new.mat', 'FE_20111010_fMRI_new.mat', 'QL_20110925_fMRI_new.mat', 'AA_20120815_fMRI_new.mat', 'DH_20120806_fMRI_new.mat', 'RI_20120815_fMRI_new.mat', 'RF_20120809_fMRI_new.mat', 'SE_20110924_fMRI_new.mat', 'RS_20120723_fMRI_new.mat', 'EU_20120803_fMRI_new.mat', 'ER_20120816_fMRI_new.mat', 'JD_20120810_fMRI_new.mat', 'JZ_20120824_fMRI_new.mat', 'DA_20120813_fMRI_new.mat', 'NN_20120824_fMRI_new.mat', 'JS_20120910_fMRI_new.mat', 'YE_20120910_fMRI_new.mat', 'RQ_20120917_fMRI_new.mat', 'FR_20120903_fMRI_new.mat', 'IQ_20120904_fMRI_new.mat', 'NN_20120831_fMRI_new.mat', 'RQ_20120903_fMRI_new.mat', 'AC_20120917_fMRI_new.mat', 'AR_20120813_fMRI_new.mat', 'JH_20120925_fMRI_new.mat', 'KI_20121009_fMRI_new.mat', 'OQ_20120925_fMRI_new.mat', 'JL_20120927_fMRI_new.mat', 'HA_20120813_fMRI_new.mat', 'CN_20120927_fMRI_new.mat', 'OK_20121011_fMRI_new.mat', 'DG_20120903_fMRI_new.mat', 'OG_20120917_fMRI_new.mat', 'JH_20121009_fMRI_new.mat'};

%Autism data:
%subsEmp = {'145', '144', '143', '142', '140_CCN', '139_CCN', '138B_CCN', '137', '136_CCN', '135', '134_CCN', '133_CCN', '132_CCN', '131', '130B', '128', '126', '125', '124', '123', '122', '120', '118', '114', '113B', '112B', '111B', '108B', '107B', '105', '103B', '102B', '101B', '100C', '86C'};

%Soccer player data:
%load('/Users/jzimmermann/Documents/PHD_Thesis/Soccer_Player/emp_FC.mat')
%subsEmp = 1:size(controls,3) 

%NKI Rockland data:
%subsEmp = {'9780496', '9716792', '9645370', '9630905', '9537916', '9536886', '9421819', '9100911', '9006154', '8735778', '8691891', '8628499', '8574662', '7212617', '7055197', '6913939', '6709880', '6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'}; % ..'6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'};


cc_mat = zeros(length(subsEmp), length(subsEmp));

for i= 1:length(subsEmp) % loop thru EmpFCs, first fix on EmpFC of subj1

    %Petras data:
    empTS = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/' subsEmp{i}]);
    empTS = empTS.fmriTS;
    %empTS = empTS(1:330,:);
    [empFC_1] = MultipleCompFDR(empTS); % creates FC matrix from time series, sig tested & MC corrected, fisher z transformed
    
    %Autism data:
    %empFC_1 = load(['/Users/jzimmermann/Documents/PHD_Thesis/UCLA_Autism/TD' subsEmp{i} '_rsfMRI_connectivity_matrix_file.txt']);
    
    %NKI Rockland data:
    %empFC_1 = load(['/Users/jzimmermann/Documents/PHD_Thesis/NKI_Rockland/' subsEmp{i} '_fcMRI_noGSR_connectivity_matrix_file.txt']);

    %Soccer player data:
    %empFC_1 = controls(:,:,i);
    
    indexe= triu(true(size(empFC_1)),1); 
    empFC1_reshaped = empFC_1(indexe);

    for j=1:length(subsEmp) %loop thru simFC?s, need to go through all params of each simFC too

        %Petras data:
        empTS = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/' subsEmp{j}]);
        empTS = empTS.fmriTS;
        %empTS = empTS(331:661,:);
        [empFC_2] = MultipleCompFDR(empTS); % creates FC matrix from time series, sig tested & MC corrected, fisher z transformed
        
        %Autism data:
        %empFC_2 = load(['/Users/jzimmermann/Documents/PHD_Thesis/UCLA_Autism/TD' subsEmp{j} '_rsfMRI_connectivity_matrix_file.txt']);
        
        %NKI Rockland data:
        %empFC_2 = load(['/Users/jzimmermann/Documents/PHD_Thesis/NKI_Rockland/' subsEmp{j} '_fcMRI_noGSR_connectivity_matrix_file.txt']);

        %Soccer player data:
        %empFC_2 = controls(:,:,j);
        
        indexe= triu(true(size(empFC_2)),1);
        empFC2_reshaped = empFC_2(indexe);
        
        cc_mat(j,i) = corr(empFC1_reshaped,empFC2_reshaped);
    end
end

% PCA on cc_mat, to see inter-subject variability in the FCs (note if latent > 1, the PC is significant)::
[COEFF_f,latent_f,explained_f] = pcacov(cc_mat);

% Biplot of first 2 components:
biplot(COEFF_f(:,1:2), 'VarLabels', {'18' '19' '20' '21' '23' '23' '23' '23' '24' '24' '25' '25' '25' '25' '27' '27' '28' '28' '30' '30' '30' '30' '30' '31' '33' '39' '40' '42' '43' '47' '49' '51' '51' '54' '55' '56' '57' '59' '60' '62' '64' '65' '67' '68' '72' '73' '77' '80'});
set(gcf,'color','w');
xlabel('First Common Factor', 'fontsize', 16);
ylabel('Second Age Factor', 'fontsize', 16);
figure(2); plot(ages,COEFF_f(:,2), '.'); xlabel('ages', 'fontsize', 18); ylabel('eigenvalue', 'fontsize', 18); %note to self: add line of best fit


