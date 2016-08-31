% Create cc_mat, 50(subjects)x101(global coupling) - corrs between EmpFC and SimFC across params
% Create mse_mat, 50(subjects)x101(global coupling) - mse between Emp and SimFC across params
% NEW: Create modstrength_mat, 50(subjects)x101(global coupling) - modstrength (Q) of SimFCs across params
% etc...

%		global coupling (load simFC) (j)
% subj (i)

addpath ~/Software/Matlab/BCT
fields = fieldnames(ALL); 

%% Corr between empFC and simFC for all global couplings:
%%%cc_mat = zeros(50,101); 
%%%mse_mat = zeros(50,101);

%% Corr between Various graph metrics for the empFC and simFC matrices for all global couplings:
%%%clusteringcoeff_mat = zeros(50,101);
%%%localeff_mat = zeros(50,101);
%%%globaleff_mat = zeros(50,101);
%%%strength_mat = zeros(50,101);
%%%transitivity_mat = zeros(50,101);
%%%assortativity_mat = zeros(50,101);
%%%betweenness_mat = zeros(50,101);
%%%eigen_cent_mat = zeros(50,101);
%%%pagerank_mat = zeros(50,101);
%%%coreness_mat = zeros(50,101);
%%%corenessq_mat = zeros(50,101);
%%%modstrength_mat = zeros(50,101);
%%%modVI_mat = zeros(50,101);

%%%edgebetweenness_mat = zeros(50,101);

%% Mean/max corr btw best match eigenvectors of empFC and simFC for all global couplings:
%%%mean_eigen_mat = zeros(50,101); 
%%%max_eigen_mat = zeros(50,101); 

% List of network level graph metrics for empFC:
mod_emps_l = [];
Eglob_emps_l = [];
T_emps_l = [];
qcore_emps_l = [];

subs = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'LG_20140324_1130_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QL_20120814_SC.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
%age ordered:
%subs = {'AY_20111004_SC_new.mat', 'UB_20120806_SC.mat', 'IS_20120809_SC.mat', 'UK_20111004_SC_new.mat', 'IC_20120810_SC.mat', 'QR_20111010_SC_new.mat', 'RT_20110925_SC_new.mat', 'UK_20110924_SC_new.mat', 'FI_20120727_SC.mat', 'NI_20120831_SC.mat', 'FJ_20120808_SC.mat', 'XB_20120831_SC.mat', 'RI_20110924_SC_new.mat','GC_20120803_SC.mat', 'BQ_20120904_SC_new.mat', 'FE_20111010_SC_new.mat', 'QL_20110925_SC_new.mat', 'AA_20120815_SC.mat', 'DH_20120806_SC.mat', 'RI_20120815_SC.mat', 'RF_20120809_SC.mat', 'SE_20110924_SC_new.mat', 'RS_20120723_SC.mat', 'EU_20120803_SC.mat', 'ER_20120816_SC.mat', 'JD_20120810_SC.mat', 'JZ_20120824_SC.mat', 'DA_20120813_SC.mat', 'NN_20120824_SC.mat', 'JS_20120910_SC.mat', 'YE_20120910_SC.mat', 'RQ_20120917_SC.mat', 'FR_20120903_SC.mat', 'IQ_20120904_SC.mat', 'NN_20120831_SC.mat', 'RQ_20120903_SC.mat', 'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'JH_20120925_SC.mat', 'KI_20121009_SC.mat', 'OQ_20120925_SC.mat', 'JL_20120927_SC.mat', 'HA_20120813_SC.mat', 'CN_20120927_SC.mat', 'OK_20121011_SC.mat', 'DG_20120903_SC.mat', 'OG_20120917_SC.mat', 'JH_20121009_SC.mat'};

csf = {'0.03', '0.0301', '0.0302', '0.0303', '0.0304', '0.0305', '0.0306', '0.0307', '0.0308', '0.0309', '0.031', '0.0311', '0.0312', '0.0313', '0.0314', '0.0315', '0.0316', '0.0317', '0.0318', '0.0319', '0.032', '0.0321', '0.0322', '0.0323', '0.0324', '0.0325', '0.0326', '0.0327', '0.0328', '0.0329', '0.033', '0.0331', '0.0332', '0.0333', '0.0334', '0.0335', '0.0336', '0.0337', '0.0338', '0.0339', '0.034', '0.0341', '0.0342', '0.0343', '0.0344', '0.0345', '0.0346', '0.0347', '0.0348', '0.0349', '0.035', '0.0351', '0.0352', '0.0353', '0.0354', '0.0355', '0.0356', '0.0357', '0.0358', '0.0359', '0.036', '0.0361', '0.0362', '0.0363', '0.0364', '0.0365', '0.0366', '0.0367', '0.0368', '0.0369', '0.037', '0.0371', '0.0372', '0.0373', '0.0374', '0.0375', '0.0376', '0.0377', '0.0378', '0.0379', '0.038', '0.0381', '0.0382', '0.0383', '0.0384', '0.0385', '0.0386', '0.0387', '0.0388', '0.0389', '0.039', '0.0391', '0.0392', '0.0393', '0.0394', '0.0395', '0.0396', '0.0397', '0.0398', '0.0399', '0.04'};

for  i=1:length(subs) %ind of empFC
    empFC = ALL.(fields{i}).empFC; 
    empFC = abs(empFC); %absolute val
    indexe = triu(true(size(empFC)),1);
    empFC_reshape = empFC(indexe);
    % SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subs{i} '/weights.txt']);
    % indexsc = triu(true(size(SC)),1);
    % SC_reshape = SC(indexsc);
    
    % Compute nodal graph metrics on empFC:
    %%%C_empFC = clustering_coef_wu(empFC);
    %%%Eloc_empFC = efficiency_wei(empFC,1);
    %%%strgth_empFC = strengths_und(empFC);
    %%%eigen_empFC = eigenvector_centrality_und(empFC);
    %%%pagerank_empFC = pagerank_centrality(empFC, .85);
    %%%[Ci_empFC, Q_empFC] = modularity_finetune_und_sign(empFC);
    
    % Compute edge-wise graph metrics on empFC (ie 68*68 values):
    %%%[EBC_empFC BC_empFC] = edge_betweenness_wei(1./empFC); %EBC is edgewise, BC is nodal
    
    % Compute network level graph metrics on empFC:
    %%%Eglob_empFC = efficiency_wei(empFC); %inversely related to charpath
    %%%T_empFC = transitivity_wu(empFC);
    %%%assort_empFC = assortativity_wei(empFC,0);
    %%%[core_empFC,qcore_empFC] = core_periphery_dir(empFC);
    
    % List of network level metrics for all empFCs:
    %%%Eglob_emps_l(end+1) = Eglob_empFC;
    %%%T_emps_l(end+1) = T_empFC;
    %%%qcore_emps_l(end+1) = qcore_empFC;
    %%%mod_emps_l(end+1) = Q_empFC;
    
    % Compute PCA on empFC:
    %%%[COEFF_e,latent_e,explained_e] = pcacov(empFC);
    %%%emp_PCs = COEFF_e(:,1:10);
    

    for j = 1:length(csf) %ind of csf, looping thru the simFCs per csf
        SimFC = load(['/Volumes/MY_DRIVE/Paul_series2/' subs{i} '/cspeed100/csf ' csf{j} '/bold.mat']);
        SimFC = SimFC.arr;
        SimFC = squeeze(SimFC);
        SimFC = SimFC(41:end,:);
        SimFC = downsample(SimFC,4);
        SimFC = corr(SimFC);
        SimFC = abs(SimFC); %absolute val
        indexs = triu(true(size(SimFC)),1);
        SimFC_reshape = SimFC(indexs);
        
        % SimFC-EmpFC corr:
        %%%cc_mat(i,j) = corr(SimFC_reshape, empFC_reshape);
        % MSE calculations:
        %%%[PSNR,MSE,MAXERR,L2RAT] = measerr(SimFC_reshape,empFC_reshape);
        %%%mse_mat(i,j) = MSE;

        % Compute nodal graph metrics on SimFC:
        %%%C_simFC = clustering_coef_wu(SimFC);
        %%%Eloc_simFC = efficiency_wei(SimFC,1);
        %%%strgth_simFC = strengths_und(SimFC);
        %%%eigen_simFC = eigenvector_centrality_und(SimFC);
        %%%pagerank_simFC = pagerank_centrality(SimFC, .85);
        %%%[Ci_simFC, Q_simFC] = modularity_finetune_und_sign(SimFC);
        
        %Compute edge-wise graph metrics on empFC (ie 68*68 values):
        %%%[EBC_simFC BC_simFC] = edge_betweenness_wei(1./SimFC);
        
        % Compute network level graph metrics on SimFC, only 1 scalar per network:
        %%%Eglob_simFC = efficiency_wei(SimFC);
        %%%T_simFC = transitivity_wu(SimFC);
        %%%assort_simFC = assortativity_wei(SimFC,0);
        %%%[core_simFC,qcore_simFC] = core_periphery_dir(SimFC);
        
        % Compute PCA on simFC:
        %%%[COEFF_s,latent_s,explained_s] = pcacov(SimFC);
        %%%sim_PCs = COEFF_s(:,1:10);
        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        % Correlate nodal graph metrics of EmpFC and of SimFC:
        %%%clusteringcoeff_mat(i,j) = corr(C_simFC, C_empFC);
        %%%localeff_mat(i,j) = corr(Eloc_simFC, Eloc_empFC);
        %%%strength_mat(i,j) = corr(strgth_empFC', strgth_simFC');
        %%%betweenness_mat(i,j) = corr(BC_empFC, BC_simFC);
        %%%eigen_cent_mat(i,j) = corr(eigen_empFC, eigen_simFC);
        %%%pagerank_mat(i,j) = corr(pagerank_empFC, pagerank_simFC);
        %%%coreness_mat(i,j) = corr(core_empFC', core_simFC');
        %%%VIn = partition_distance(Ci_simFC,Ci_empFC);
        %%%modVI_mat(i,j) = VIn;
        
        % Correlate edge-wise graph metrics of EmpFC and of SimFC:
        %%%edgebetweenness_mat(i,j) = corr(reshape(EBC_empFC, 68*68,1), reshape(EBC_simFC, 68*68,1));
        
        % Network level graph metrics on simFC:
        %%%globaleff_mat(i,j) = Eglob_simFC;
        %%%transitivity_mat(i,j) = T_simFC;
        %%%assortativity_mat(i,j) = assort_simFC;
        %%%corenessq_mat(i,j) = qcore_simFC;
        %%%modstrength_mat(i,j) = Q_simFC;
       
        % PCA SimFC-EmpFC corr:
        %%%eigenvector_corrs = corr(emp_PCs, sim_PCs); % 10*10 corrs btw eigenvectors of empFC(rows) and of SimFC(cols)
        %%%max_eigenvector_corrs = max(eigenvector_corrs,[],2); % max along each emp_PC eigenvector corr
        %%%mean_eigen_mat(i,j) = mean(max_eigenvector_corrs); %given 10 biggest eigenvector corrs for each emp_PC, take the mean of the 10
        %%%max_eigen_mat(i,j) = max(max_eigenvector_corrs); %%given 10 biggest eigenvector corrs for each emp_PC, take the max of the 10
        
    end
end

imagesc(cc_mat);
xlabel('Global Coupling', 'fontsize', 12);
ylabel('Subjects', 'fontsize', 12);
title('Correlation between EmpFC and SimFC for each subject and global coupling', 'fontsize', 14);
colorbar;

figure(2);
imagesc(mse_mat);
xlabel('Global Coupling', 'fontsize', 12);
ylabel('Subjects', 'fontsize', 12);
title('MSE between EmpFC and SimFC for each subject and global coupling', 'fontsize', 14);
colorbar;

figure(3);
plot(mean(cc_mat,1));
xlabel('Global Coupling', 'fontsize', 12);
ylabel('Correlation coefficient', 'fontsize', 12);
title('Mean of all subjects', 'fontsize', 12);

figure(4);
plot(mean(mse_mat,1));
xlabel('Global Coupling', 'fontsize', 12);
ylabel('Correlation coefficient', 'fontsize', 12);
title('Mean of all subjects', 'fontsize', 12);

%figure(5);
%imagesc(modstrength_mat);
%xlabel('Global Coupling', 'fontsize', 12);
%ylabel('Subjects', 'fontsize', 12);
%title('Modularity strength of SimFC for each subject and global coupling', 'fontsize', 14);
%colorbar;

%figure(6);
%plot(mean(modstrength_mat,1));
%xlabel('Global Coupling', 'fontsize', 12);
%ylabel('Modularity Strength of SimFC', 'fontsize', 12);
%title('Mean of all subjects', 'fontsize', 12);

