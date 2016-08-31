load('/Volumes/MY_DRIVE/Paul_series2/analysis.mat')
fields = fieldnames(ALL);

%%%% Load 3 simFCs and 3 empFCs:
empFC_AA = ALL.(fields{1}).empFC;
empFC_AC = ALL.(fields{2}).empFC;
empFC_AR = ALL.(fields{3}).empFC;

simFC_AA = ALL.(fields{1}).highest_CC_simFC;
simFC_AC = ALL.(fields{2}).highest_CC_simFC;
simFC_AR = ALL.(fields{3}).highest_CC_simFC;

%%%% PCA on each of the FCs:
[COEFF_e_AA,latent_e_AA,explained_e_AA] = pcacov(empFC_AA);
[COEFF_e_AC,latent_e_AC,explained_e_AC] = pcacov(empFC_AC);
[COEFF_e_AR,latent_e_AR,explained_e_AR] = pcacov(empFC_AR);

[COEFF_s_AA,latent_s_AA,explained_s_AA] = pcacov(simFC_AA);
[COEFF_s_AC,latent_s_AC,explained_s_AC] = pcacov(simFC_AC);
[COEFF_s_AR,latent_s_AR,explained_s_AR] = pcacov(simFC_AR);


%%%%%%% Bar plots of PC1 EmpFCs against PC1 SimFCs %%%%%%%
%%%% EmpFC AA - SimFC AA %%%%
h = figure(1);
subplot(3,1,1);
AA_e = bar(COEFF_e_AA(:,1)); %plot all 68 eigenvalues of PC1 of empFC AA
AA_eh = get(AA_e,'child');
set(AA_eh,'facea',.6);
hold on;
AA_s = bar(COEFF_s_AA(:,1), 'r');
AA_sh = get(AA_s, 'child');
set(AA_sh,'facea',.6);
ylabel('PC 1', 'fontsize', 24);
%legend('Emp AA', 'Sim AA');

%compute corr and se of corr by bootstrapping
corr_AA_e_AA_s = corr(COEFF_e_AA(:,1), COEFF_s_AA(:,1));
rng default; 
[bootstat,bootsam] = bootstrp(1000,@corr,COEFF_e_AA(:,1),COEFF_s_AA(:,1));
se_AA_e_AA_s = std(bootstat);



%%%% EmpFC AA - SimFC AC %%%%
subplot(3,1,2);
AA_e = bar(COEFF_e_AA(:,1)); %plot all 68 eigenvalues of PC1 of empFC AA
AA_eh = get(AA_e,'child');
set(AA_eh,'facea',.6);
hold on;
AC_s = bar(COEFF_s_AC(:,1), 'y');
AC_sh = get(AC_s, 'child');
set(AC_sh,'facea',.6);
ylabel('PC 1', 'fontsize', 24);
%legend('Emp AA', 'Sim AC');

%compute corr and se of corr by bootstrapping
corr_AA_e_AC_s = corr(COEFF_e_AA(:,1), COEFF_s_AC(:,1));
rng default; 
[bootstat,bootsam] = bootstrp(1000,@corr,COEFF_e_AA(:,1),COEFF_s_AC(:,1));
se_AA_e_AC_s = std(bootstat);




%%%% EmpFC AA - SimFC AR %%%%
subplot(3,1,3);
AA_e = bar(COEFF_e_AA(:,1)); %plot all 68 eigenvalues of PC1 of empFC AA
AA_eh = get(AA_e,'child');
set(AA_eh,'facea',.6);
hold on;
AR_s = bar(COEFF_s_AR(:,1), 'm');
AR_sh = get(AR_s, 'child');
set(AR_sh,'facea',.6);
xlabel('Regions', 'fontsize', 24);
ylabel('PC 1', 'fontsize', 24);
%legend('Emp AA', 'Sim AR');

%compute corr and se of corr by bootstrapping
corr_AA_e_AR_s = corr(COEFF_e_AA(:,1), COEFF_s_AR(:,1));
rng default; 
[bootstat,bootsam] = bootstrp(1000,@corr,COEFF_e_AA(:,1),COEFF_s_AR(:,1));
se_AA_e_AR_s = std(bootstat);



set(gcf,'color','w');




