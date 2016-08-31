i% Creates corr_mat, matrix of simFC-empFC corrs for all subjects: 
%       AASim ACSim AYSim (based on each subs ideal params)
%AAEmp
%ACEmp
%AYEmp
%
% Takes ALL, struct from Paul. corr_mat based on the simFC of ideal
% params for that subject. Also creates mse_mat, the mean sq error btw
% ideal SimFC and empFC

% Note: correlates top triangle of matrices, no significance testing on matrices, non-normal dists

corr_mat = zeros(50,50); 
mse_mat = zeros(50,50);
max_eigen_mat = zeros(50,50);

fields = fieldnames(ALL);
for i = 1:50
for j = 1:50

	empFC = ALL.(fields{i}).empFC;
    indexe = triu(true(size(empFC)),1); 
    empFC_reshaped = empFC(indexe);
    [COEFF_e,latent_e,explained_e] = pcacov(empFC);
    emp_PCs = COEFF_e(:,1:10);

	simFC = ALL.(fields{j}).highest_CC_simFC;
    indexs = triu(true(size(simFC)),1);
    simFC_reshaped = simFC(indexs);
    [COEFF_s,latent_s,explained_s] = pcacov(simFC);
    sim_PCs = COEFF_s(:,1:10);

	corr_mat(i,j) = corr(empFC_reshaped, simFC_reshaped);

    % CC btw eigenvectors of empFC and eigenvectors of simFC (the maximum CC for any combination of PCs)
    eigenvector_corrs = corr(emp_PCs, sim_PCs); % 10*10 corrs btw eigenvectors of empFC(rows) and of SimFC(cols)
    max_eigenvector_corrs = max(eigenvector_corrs,[],2); % max along each emp_PC eigenvector corr
    max_eigen_mat(i,j) = max(max_eigenvector_corrs);

    [PSNR,MSE,MAXERR,L2RAT] = measerr(empFC_reshaped,simFC_reshaped);
    mse_mat(i,j) = MSE;
end
end

%%%%%%%%% testing subject specificity of corr_mat:
% To get mean of top triangle:  0.4455
indexu= triu(true(size(corr_mat)),1);
top_tri = corr_mat(indexu);
mean_toptri = mean(top_tri)

% To get mean of bottom triangle:  0.4542
indexl= tril(true(size(corr_mat)),-1);
bottom_tri = corr_mat(indexl);
mean_bottomtri = mean(bottom_tri)

% To get mean of diag: 0.4908
diag_elements = diag(corr_mat);
mean_diag = mean(diag_elements)


% T-Test to evaluate if difference is significant:
H_corr_mat = ttest2(bottom_tri, diag_elements) % *
H_corr_mat = ttest2(top_tri, diag_elements) % *


%%%%%%%%% testing subject specificity of mse_mat:
% To get mean of top triangle:  0.0948
indexu= triu(true(size(mse_mat)),1);
top_tri = mse_mat(indexu);
mean_toptri = mean(top_tri)

% To get mean of bottom triangle:  0.0886
indexl= tril(true(size(mse_mat)),-1);
bottom_tri = mse_mat(indexl);
mean_bottomtri = mean(bottom_tri)

% To get mean of diag: 0.0690
diag_elements = diag(mse_mat);
mean_diag = mean(diag_elements)

% T-Test to evaluate if difference is significant:
H_mse_mat = ttest2(bottom_tri, diag_elements) % *
H_mse_mat = ttest2(top_tri, diag_elements) % *