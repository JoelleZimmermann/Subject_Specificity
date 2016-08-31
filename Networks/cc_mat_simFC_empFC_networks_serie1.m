% For 4D images, Series 1:
%         csf(j)
%speed(k)
%

fields = fieldnames(ALL); 

cc_mat = zeros(5,21);

% Network measures:
localeff_mat = zeros(5,21);
strength_mat = zeros(5,21);
pagerank_mat = zeros(5,21);

% PCA eigenvector corrs:
max_eigen_mat = zeros(5,21);

addpath ~/Software/Matlab/BCT
subs = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'LG_20140324_1130_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QL_20120814_SC.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};

csf = {'0.05', '0.06', '0.07', '0.08', '0.09', '0.1', '0.11', '0.12', '0.13', '0.14', '0.15', '0.16', '0.17', '0.18', '0.19', '0.2', '0.21', '0.22', '0.23', '0.24', '0.25'};
cspeed = {'cspeed20', 'cspeed40', 'cspeed60', 'cspeed80', 'cspeed100'};

cc_indexes = [1,6,11,16];
eff_indexes = [2,7,12,17];
str_indexes = [3,8,13,18];
pgrank_indexes = [4,9,14,19];
pca_indexes = [5,10,15,20];

for  i=1:length(subs)
    empFC = ALL.(fields{i}).empFC;
    empFC = abs(empFC);
    indexe = triu(true(size(empFC)),1);
    empFC_reshape = empFC(indexe);
    
    % Compute nodal graph metrics on empFC:
    Eloc_empFC = efficiency_wei(empFC,1);
    strgth_empFC = strengths_und(empFC);
    pagerank_empFC = pagerank_centrality(empFC, .85);
    
    % Compute PCA on empFC:
    [COEFF_e,latent_e,explained_e] = pcacov(empFC);
    emp_PCs = COEFF_e(:,1:10);

    for k = 1:length(cspeed)
        for j= 1:length(csf)
            SimFC = load(['/Volumes/MY_DRIVE/Paul_series1/' subs{i} '/' cspeed{k} '/csf ' csf{j} '/bold.mat']);
            SimFC = SimFC.arr;
            SimFC = squeeze(SimFC);
            SimFC = SimFC(41:end,:);
            SimFC = downsample(SimFC,4);
            SimFC = corr(SimFC);
            SimFC = abs(SimFC); %absolute val
            indexs = triu(true(size(SimFC)),1);
            SimFC_reshape = SimFC(indexs);
            cc_mat(k,j) = corr(SimFC_reshape,empFC_reshape);
            
            % Compute nodal graph metrics on SimFC:
            Eloc_simFC = efficiency_wei(SimFC,1);
            strgth_simFC = strengths_und(SimFC);
            pagerank_simFC = pagerank_centrality(SimFC, .85);
            
            % Compute PCA on simFC:
            [COEFF_s,latent_s,explained_s] = pcacov(SimFC);
            sim_PCs = COEFF_s(:,1:10);
            
            % Correlate nodal graph metrics of EmpFC and of SimFC:
            localeff_mat(k,j) = corr(Eloc_empFC, Eloc_simFC);
            strength_mat(k,j) = corr(strgth_empFC', strgth_simFC');
            pagerank_mat(k,j) = corr(pagerank_empFC, pagerank_simFC);
            
            % Correlate eigenvectors of EmpFC and of SimFC:
            eigenvector_corrs = corr(emp_PCs, sim_PCs); % 10*10 corrs btw eigenvectors of empFC(rows) and of SimFC(cols)
            max_eigenvector_corrs = max(eigenvector_corrs,[],2); % max along each emp_PC eigenvector corr
            max_eigen_mat(k,j) = max(max_eigenvector_corrs);
            
        end
    end    
    
    %%subplot(4,5,cc_indexes(i));
    %%imagesc(cc_mat);
    
    %%subplot(4,5,eff_indexes(i));
    %%imagesc(localeff_mat);
    
    %%subplot(4,5,str_indexes(i));
    %%imagesc(strength_mat);
    
    %%subplot(4,5, pgrank_indexes(i));
    %%imagesc(pagerank_mat);

    %%subplot(4,5, pca_indexes(i));
    %%imagesc(max_eigen_mat);
    
    cc_mat_3d(:,:,i) = cc_mat;
    localeff_mat_3d(:,:,i) = localeff_mat;
    strength_mat_3d(:,:,i) = strength_mat;
    pagerank_mat_3d(:,:,i) = pagerank_mat;
    max_eigen_mat_3d(:,:,i) = max_eigen_mat;
    
end