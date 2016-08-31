% Like: cc_mat_simFC_empFC_petra.m, but cut empTS and simTS into windows,
% and use the window of empTS and window of simTS that creates the highest
% sim-emp corr for each subject. 

% Compare simFC-empFC (50x50 matrix), (unbiased, because based on simFC's
% based on every subs 'ideal' csfs), average simFC-empFC corrs across
% corrs based on all simFCs based on all ideal csfs)
%
%
% cc_mat:
% 		EmpFC (i)
% SimFC (j)
%
%NOTE: this script doesnt include QL_20120814 (orig 37th subject) and LG_20140324_1130 (orig
%28th sub).
%Note: takes whole matrices not triangles, uncorrected, non-normal

addpath /Users/jzimmermann/Documents/PHD_Thesis/Python_stuff/My_tvb/Subject_Specificity

% ideal_csf = {'0.0328', '0.0329', '0.0395', '0.0325', '0.0343', '0.0329', '0.0314', '0.0376', '0.0348', '0.0328', '0.0309', '0.0361', '0.0316', '0.0332', '0.0388', '0.0358', '0.0305', '0.0326', '0.0325', '0.0313', '0.0333', '0.0339', '0.0321', '0.032', '0.0333', '0.0341', '0.0319', '0.0314', '0.0302', '0.0331', '0.034', '0.0332', '0.0327', '0.0336', '0.0321', '0.03', '0.0327', '0.0314', '0.0312', '0.0317', '0.0331', '0.0316', '0.0321', '0.0333', '0.0335', '0.0308', '0.0355', '0.0313'};
ideal_csf = {'0.03', '0.0301', '0.0302', '0.0303', '0.0304', '0.0305', '0.0306', '0.0307', '0.0308', '0.0309', '0.031', '0.0311', '0.0312', '0.0313', '0.0314', '0.0315', '0.0316', '0.0317', '0.0318', '0.0319', '0.032', '0.0321', '0.0322', '0.0323', '0.0324', '0.0325', '0.0326', '0.0327', '0.0328', '0.0329', '0.033', '0.0331', '0.0332', '0.0333', '0.0334', '0.0335', '0.0336', '0.0337', '0.0338', '0.0339', '0.034', '0.0341', '0.0342', '0.0343', '0.0344', '0.0345', '0.0346', '0.0347', '0.0348', '0.0349', '0.035', '0.0351', '0.0352', '0.0353', '0.0354', '0.0355', '0.0356', '0.0357', '0.0358', '0.0359', '0.036', '0.0361', '0.0362', '0.0363', '0.0364', '0.0365', '0.0366', '0.0367', '0.0368', '0.0369', '0.037', '0.0371', '0.0372', '0.0373', '0.0374', '0.0375', '0.0376', '0.0377', '0.0378', '0.0379', '0.038', '0.0381', '0.0382', '0.0383', '0.0384', '0.0385', '0.0386', '0.0387', '0.0388', '0.0389', '0.039', '0.0391', '0.0392', '0.0393', '0.0394', '0.0395', '0.0396', '0.0397', '0.0398', '0.0399', '0.04'};
cc_mat = zeros(48,48);
subsSim = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};
subsEmp = {'AA_20120815_fMRI_new.mat', 'AC_20120917_fMRI_new.mat', 'AR_20120813_fMRI_new.mat', 'AY_20111004_fMRI_new.mat', 'BQ_20120904_fMRI_new.mat', 'CN_20120927_fMRI_new.mat', 'DA_20120813_fMRI_new.mat', 'DG_20120903_fMRI_new.mat', 'DH_20120806_fMRI_new.mat', 'ER_20120816_fMRI_new.mat', 'EU_20120803_fMRI_new.mat', 'FE_20111010_fMRI_new.mat', 'FI_20120727_fMRI_new.mat', 'FJ_20120808_fMRI_new.mat', 'FR_20120903_fMRI_new.mat', 'GC_20120803_fMRI_new.mat', 'HA_20120813_fMRI_new.mat', 'IC_20120810_fMRI_new.mat', 'IQ_20120904_fMRI_new.mat', 'IS_20120809_fMRI_new.mat', 'JD_20120810_fMRI_new.mat', 'JH_20120925_fMRI_new.mat', 'JH_20121009_fMRI_new.mat', 'JL_20120927_fMRI_new.mat', 'JS_20120910_fMRI_new.mat', 'JZ_20120824_fMRI_new.mat', 'KI_20121009_fMRI_new.mat', 'NI_20120831_fMRI_new.mat', 'NN_20120824_fMRI_new.mat', 'NN_20120831_fMRI_new.mat', 'OG_20120917_fMRI_new.mat', 'OK_20121011_fMRI_new.mat', 'OQ_20120925_fMRI_new.mat', 'QL_20110925_fMRI_new.mat', 'QR_20111010_fMRI_new.mat', 'RF_20120809_fMRI_new.mat', 'RI_20110924_fMRI_new.mat', 'RI_20120815_fMRI_new.mat', 'RQ_20120903_fMRI_new.mat', 'RQ_20120917_fMRI_new.mat', 'RS_20120723_fMRI_new.mat', 'RT_20110925_fMRI_new.mat', 'SE_20110924_fMRI_new.mat', 'UB_20120806_fMRI_new.mat', 'UK_20110924_fMRI_new.mat', 'UK_20111004_fMRI_new.mat', 'XB_20120831_fMRI_new.mat', 'YE_20120910_fMRI_new.mat'};
fields = fieldnames(ALL);

for i= 1:48 % loop thru EmpFCs, first fix on EmpFC of subj1

	
    empTS = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/' subsEmp{i}]);
    empTS = empTS.fmriTS;
    [ FC3D_Per_Window_empTS ] = TS_To_FC_Per_Window( empTS, 2000, 60000, 30 );
    
	for j=1:length(subsSim) %loop thru simFC?s, need to go through all params of each simFC too 
		ideal_csf_simempcorrs = []; % will have 48 vals (the simfc-empfc corrs) when done looping thru ideal_csf

		for k=1:length(ideal_csf) %looping thru the (101) csfs each time getting its simFC. 
       		simFC = load(['/Volumes/MY_DRIVE/Paul_series2/' subsSim{j} '/cspeed100/csf ' ideal_csf{k} '/bold.mat']);
			simFC = simFC.arr;
			simFC = squeeze(simFC);
			simFC = simFC(41:end,:); 
			simFC = downsample(simFC,4); % simFC = 80*68
            [ FC3D_Per_Window_simTS ] = TS_To_FC_Per_Window( simFC, 2000, 60000, 30 ); %CHECK IF SIZE IS RIGHT.
            sim_emp_corrs = []; % lst of all combos of sim-emp corrs (based on time windows from simTS & empTS), for 1 sub
			for m = 1:size(FC3D_Per_Window_empTS,3)         
                for n = 1:size(FC3D_Per_Window_simTS,3)
                    sim_emp_corrs(end+1)=corr(reshape(FC3D_Per_Window_empTS(:,:,m), 68*68,1), reshape(FC3D_Per_Window_simTS(:,:,n), 68*68,1));
                end
            end    
			ideal_csf_simempcorrs(end+1)=max(sim_emp_corrs); % could save the index using find
		end	

		mean_cc = mean(ideal_csf_simempcorrs);
		cc_mat(j,i) = mean_cc;
	end
end	

% To get mean of top triangle: 
indexu= triu(true(size(cc_mat)),1);
top_tri = cc_mat(indexu);
mean(top_tri)

% To get mean of bottom triangle: 
indexl= tril(true(size(cc_mat)),-1);
bottom_tri = cc_mat(indexl);
mean(bottom_tri)

% To get mean of diag: 
diag_elements = diag(cc_mat);
mean(diag_elements)

% T-Test to evaluate if difference is significant:
H = ttest2(bottom_tri, diag_elements) % *insig!
H = ttest2(top_tri, diag_elements) % *insig!