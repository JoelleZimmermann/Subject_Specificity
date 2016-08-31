% Individual predictivity for SC's (ie SC1 with SC1, SC2, SC3..)

%Petras data: 
%subsSC = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
%Age ordered:
subsSC = {'AY_20111004_SC_new.mat', 'UB_20120806_SC.mat', 'IS_20120809_SC.mat', 'UK_20111004_SC_new.mat', 'IC_20120810_SC.mat', 'QR_20111010_SC_new.mat', 'RT_20110925_SC_new.mat', 'UK_20110924_SC_new.mat', 'FI_20120727_SC.mat', 'NI_20120831_SC.mat', 'FJ_20120808_SC.mat', 'XB_20120831_SC.mat', 'RI_20110924_SC_new.mat', 'GC_20120803_SC.mat', 'BQ_20120904_SC_new.mat', 'FE_20111010_SC_new.mat', 'QL_20110925_SC_new.mat', 'AA_20120815_SC.mat', 'DH_20120806_SC.mat', 'RI_20120815_SC.mat', 'RF_20120809_SC.mat', 'SE_20110924_SC_new.mat', 'RS_20120723_SC.mat', 'EU_20120803_SC.mat', 'ER_20120816_SC.mat', 'JD_20120810_SC.mat', 'JZ_20120824_SC.mat', 'DA_20120813_SC.mat', 'NN_20120824_SC.mat', 'JS_20120910_SC.mat', 'YE_20120910_SC.mat', 'RQ_20120917_SC.mat', 'FR_20120903_SC.mat', 'IQ_20120904_SC.mat', 'NN_20120831_SC.mat', 'RQ_20120903_SC.mat', 'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'JH_20120925_SC.mat', 'KI_20121009_SC.mat', 'OQ_20120925_SC.mat', 'JL_20120927_SC.mat', 'HA_20120813_SC.mat', 'CN_20120927_SC.mat', 'OK_20121011_SC.mat', 'DG_20120903_SC.mat', 'OG_20120917_SC.mat', 'JH_20121009_SC.mat'};
%Age ordered bwflav from orig:
%subsSC = {'AY_20111004_SC.mat', 'UB_20120806_SC.mat', 'IS_20120809_SC.mat', 'UK_20111004_SC.mat', 'IC_20120810_SC.mat', 'QR_20111010_SC.mat', 'RT_20110925_SC.mat', 'UK_20110924_SC.mat', 'FI_20120727_SC.mat', 'NI_20120831_SC.mat', 'FJ_20120808_SC.mat', 'XB_20120831_SC.mat', 'RI_20110924_SC.mat', 'GC_20120803_SC.mat', 'BQ_20120904_SC.mat', 'FE_20111010_SC.mat', 'QL_20110925_SC.mat', 'AA_20120815_SC.mat', 'DH_20120806_SC.mat', 'RI_20120815_SC.mat', 'RF_20120809_SC.mat', 'SE_20110924_SC.mat', 'RS_20120723_SC.mat', 'EU_20120803_SC.mat', 'ER_20120816_SC.mat', 'JD_20120810_SC.mat', 'JZ_20120824_SC.mat', 'DA_20120813_SC.mat', 'NN_20120824_SC.mat', 'JS_20120910_SC.mat', 'YE_20120910_SC.mat', 'RQ_20120917_SC.mat', 'FR_20120903_SC.mat', 'IQ_20120904_SC.mat', 'NN_20120831_SC.mat', 'RQ_20120903_SC.mat', 'AC_20120917_SC.mat', 'AR_20120813_SC.mat', 'JH_20120925_SC.mat', 'KI_20121009_SC.mat', 'OQ_20120925_SC.mat', 'JL_20120927_SC.mat', 'HA_20120813_SC.mat', 'CN_20120927_SC.mat', 'OK_20121011_SC.mat', 'DG_20120903_SC.mat', 'OG_20120917_SC.mat', 'JH_20121009_SC.mat'};


%Autism data:
%subsSC = {'145', '144', '143', '142', '140_CCN', '139_CCN', '138_CCN', '137', '136_CCN', '135', '134_CCN', '133B_CCN', '132_CCN', '131B', '130B', '128B', '126B', '125B', '124B', '123B', '122B', '120B', '118B', '114B', '113B', '112B', '111B', '108B', '107B', '105B', '103', '102B', '101', '100B', '86C'};

%Soccer player data:
%load('/Users/jzimmermann/Documents/PHD_Thesis/Soccer_Player/SC_orderer.mat')
%subsSC = 1:size(c_weight,3) 

%NKI Rockland data:
%subsSC = {'9780496', '9716792', '9645370', '9630905', '9537916', '9536886', '9421819', '9100911', '9006154', '8735778', '8691891', '8628499', '8574662', '7212617', '7055197', '6913939', '6709880', '6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'}; % ..'6692978','6539040', '6471972', '5844518', '5461463', '5279162', '5205221', '5161117', '5108043', '4791943', '4710111', '4487215', '4417007', '4323037', '4290056', '4288245', '4277600','4230470', '4188346', '4176156', '4154799', '4143704', '4126393','4119751','4100790', '4099085', '4089896', '4087509', '4077433', '4026825', '4015919', '4006955' , '3989122', '3965194', '3951328', '3934325', '3927656', '3911767', '3895064', '3893245'};

cc_mat = zeros(length(subsSC), length(subsSC));
cc_mat_dists = zeros(length(subsSC),length(subsSC));

for i= 1:length(subsSC) 
    
    %Petras data
    SC_1 = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subsSC{i} '/weights.txt']);
    dist_1 = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subsSC{i} '/tract_lengths.txt']);
    
    %Petras bwflav from orig:
    %SC_1 = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/' subsSC{i}]);
    %SC_1 = SC_1.SC_cap_agg_bwflav1;
    
    %UCLA Autism data
    %SC_1 = load(['/Users/jzimmermann/Documents/PHD_Thesis/UCLA_Autism/TD' subsSC{i} '_DTI_connectivity_matrix_file.txt']);
    %SC_1 = log10(SC_1+1); 
    %SC_1 = SC_1/(max(max(SC_1)));
    
    %Soccer player data:
    %SC_1 = c_weight(:,:,i);
    
    %NKI Rockland data
    %SC_1 = load(['/Users/jzimmermann/Documents/PHD_Thesis/NKI_Rockland/' subsSC{i} '_DTI_connectivity_matrix_file.txt']);
    %SC_1 = log10(SC_1+1); 
    %SC_1 = SC_1/(max(max(SC_1)));
    
    indexsc1= triu(true(size(SC_1)),1); 
    SC1_reshaped = SC_1(indexsc1);
    
    %distance regressed SCs
    %indexd = triu(true(size(dist_1)),1);
    %dist1_reshaped = dist_1(indexd);
    %[B1,BINT1,R1] = regress(SC1_reshaped,dist1_reshaped);   

    
    for j=1:length(subsSC) %loop thru simFCs, need to go through all params of each simFC too
        
        %Petras data
        SC_2 = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subsSC{j} '/weights.txt']);
        dist_2 = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subsSC{j} '/tract_lengths.txt']);
        
        %Petras bwflav from orig:
        %SC_2 = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/' subsSC{j}]);
        %SC_2 = SC_2.SC_cap_agg_bwflav1;
        
        %UCLA Autism data:
        %SC_2 = load(['/Users/jzimmermann/Documents/PHD_Thesis/UCLA_Autism/TD' subsSC{j} '_DTI_connectivity_matrix_file.txt']);
        %SC_2 = log10(SC_2+1); 
        %SC_2 = SC_2/(max(max(SC_2)));
        
        %Soccer player data:
        %SC_2 = c_weight(:,:,j); 
        
        %Rockland data:
        %SC_2 = load(['/Users/jzimmermann/Documents/PHD_Thesis/NKI_Rockland/' subsSC{j} '_DTI_connectivity_matrix_file.txt']);
        %SC_2 = log10(SC_2+1); 
        %SC_2 = SC_2/(max(max(SC_2)));
        
        indexsc2= triu(true(size(SC_2)),1); 
        SC2_reshaped = SC_2(indexsc2);
        
        %distance regressed SCs
        %indexd = triu(true(size(dist_2)),1);
        %dist2_reshaped = dist_2(indexd);
        %[B2,BINT2,R2] = regress(SC2_reshaped,dist2_reshaped);  
        
        %cc_mat_dists(j,i) = corr(R1,R2);
        cc_mat(j,i) = corr(SC1_reshaped,SC2_reshaped);
    end
end

% PCA on cc_mat, to see inter-subject variability in the SCs (note if latent > 1, the PC is significant):
[COEFF_s,latent_s,explained_s] = pcacov(cc_mat); %COEFF_s(subject,PC) = PC coeffs or loadings, latent_s = latent var, explained_s = total % var explained by PC

% Biplot of first 2 components:
biplot(COEFF_s(:,1:2));
set(gcf,'color','w');
xlabel('First Common Factor', 'fontsize', 16);
ylabel('Second Factor', 'fontsize', 16);




