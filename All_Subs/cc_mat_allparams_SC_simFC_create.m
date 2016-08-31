% Create cc_mat, 50(subjects)x101(global coupling) - corrs between SC and
% SimFC

%		global coupling (load simFC) (j)
% subj (load SC) (i)
%
% Note: corrs whole matrices, no sig test on matrix, non-normal




cc_mat = zeros(50,101);
subs = {'AA_20120815_SC.mat',  'AC_20120917_SC_new.mat', 'AR_20120813_SC.mat', 'AY_20111004_SC_new.mat', 'BQ_20120904_SC_new.mat', 'CN_20120927_SC.mat', 'DA_20120813_SC.mat', 'DG_20120903_SC.mat', 'DH_20120806_SC.mat', 'ER_20120816_SC.mat', 'EU_20120803_SC.mat', 'FE_20111010_SC_new.mat', 'FI_20120727_SC.mat', 'FJ_20120808_SC.mat', 'FR_20120903_SC.mat', 'GC_20120803_SC.mat', 'HA_20120813_SC.mat', 'IC_20120810_SC.mat', 'IQ_20120904_SC.mat', 'IS_20120809_SC.mat', 'JD_20120810_SC.mat', 'JH_20120925_SC.mat', 'JH_20121009_SC.mat', 'JL_20120927_SC.mat', 'JS_20120910_SC.mat', 'JZ_20120824_SC.mat', 'KI_20121009_SC.mat', 'LG_20140324_1130_SC.mat', 'NI_20120831_SC.mat', 'NN_20120824_SC.mat', 'NN_20120831_SC.mat', 'OG_20120917_SC.mat', 'OK_20121011_SC.mat', 'OQ_20120925_SC.mat', 'QL_20110925_SC_new.mat', 'QL_20120814_SC.mat', 'QR_20111010_SC_new.mat', 'RF_20120809_SC.mat', 'RI_20110924_SC_new.mat', 'RI_20120815_SC.mat', 'RQ_20120903_SC.mat', 'RQ_20120917_SC.mat', 'RS_20120723_SC.mat', 'RT_20110925_SC_new.mat', 'SE_20110924_SC_new.mat', 'UB_20120806_SC.mat', 'UK_20110924_SC_new.mat', 'UK_20111004_SC_new.mat', 'XB_20120831_SC.mat', 'YE_20120910_SC.mat'};

csf = {'0.03', '0.0301', '0.0302', '0.0303', '0.0304', '0.0305', '0.0306', '0.0307', '0.0308', '0.0309', '0.031', '0.0311', '0.0312', '0.0313', '0.0314', '0.0315', '0.0316', '0.0317', '0.0318', '0.0319', '0.032', '0.0321', '0.0322', '0.0323', '0.0324', '0.0325', '0.0326', '0.0327', '0.0328', '0.0329', '0.033', '0.0331', '0.0332', '0.0333', '0.0334', '0.0335', '0.0336', '0.0337', '0.0338', '0.0339', '0.034', '0.0341', '0.0342', '0.0343', '0.0344', '0.0345', '0.0346', '0.0347', '0.0348', '0.0349', '0.035', '0.0351', '0.0352', '0.0353', '0.0354', '0.0355', '0.0356', '0.0357', '0.0358', '0.0359', '0.036', '0.0361', '0.0362', '0.0363', '0.0364', '0.0365', '0.0366', '0.0367', '0.0368', '0.0369', '0.037', '0.0371', '0.0372', '0.0373', '0.0374', '0.0375', '0.0376', '0.0377', '0.0378', '0.0379', '0.038', '0.0381', '0.0382', '0.0383', '0.0384', '0.0385', '0.0386', '0.0387', '0.0388', '0.0389', '0.039', '0.0391', '0.0392', '0.0393', '0.0394', '0.0395', '0.0396', '0.0397', '0.0398', '0.0399', '0.04'};

for  i=1:length(subs) %ind of SC
    SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subs{i} '/weights.txt']);
    SC = reshape(SC,68*68,1);

    for j = 1:length(csf) %ind of csf, looping thru the simFCs per csf
        SimFC = load(['/Volumes/MY_DRIVE/Paul_series2/' subs{i} '/cspeed100/csf ' csf{j} '/bold.mat']);
        SimFC = SimFC.arr;
        SimFC = squeeze(SimFC);
        SimFC = SimFC(41:end,:);
        SimFC = downsample(SimFC,4);
        SimFC = corr(SimFC);
        SimFC = reshape(SimFC,68*68,1);

        cc_mat(i,j) = corr(SimFC, SC);

    end
end

imagesc(cc_mat);
xlabel('Global Coupling', 'fontsize', 12);
ylabel('Subjects', 'fontsize', 12);
title('Correlation between SC and SimFC for each subject and global coupling', 'fontsize', 14);