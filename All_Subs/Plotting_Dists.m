%%% Following running one of the scripts to get corr_mat, and its top_tri (elements in the top triangle) and bottom_tri (elements in the bottom triangle), and diag_elements (the self-correlations), run Plotting_Dists to create 2 bootstrapped distributions - of 1) the diag_elements (self-corrs), and 2) the off diags (self-other corrs). See if dists are separate to investigate whether diags are sig different from off-diags

figure()
rest = [top_tri; bottom_tri];
othercorrs = bootstrp(1000, @mean, rest);
selfcorrs = bootstrp(1000, @mean, diag_elements);
%%% difference = selfcorrs-othercorrs;

hist(sort(selfcorrs));
h = findobj(gca,'Type','patch');
set(h,'FaceColor', [1 0 0])
            
hold on;
hist(sort(othercorrs));
a = findobj(gca,'Type','patch');
set(a,'FaceColor',[.4 .4 .4])

ylabel('Count', 'fontsize', 20);
xlabel('SC-FC CC', 'fontsize', 20);
set(gcf,'color','w');
legend('SC-OtherFC', 'SC-SelfFC');
print -dtiff -r600 /Users/jzimmermann/Documents/Publications/Individual-SC-FC/Figures/cc_dists.tiff;

figure()
rest = [top_tri_eigen; bottom_tri_eigen];
othercorrs = bootstrp(1000, @mean, rest);
selfcorrs = bootstrp(1000, @mean, diag_elements_eigen);
%%% difference = selfcorrs-othercorrs;

hist(sort(selfcorrs));
h = findobj(gca,'Type','patch');
set(h,'FaceColor', [1 0 0])
            
hold on;
hist(sort(othercorrs));
a = findobj(gca,'Type','patch');
set(a,'FaceColor',[.4 .4 .4])

ylabel('Count', 'fontsize', 20);
xlabel('SC-FC PC CC', 'fontsize', 20);
set(gcf,'color','w');
legend('SC-OtherFC', 'SC-SelfFC');
print -dtiff -r600 /Users/jzimmermann/Documents/Publications/Individual-SC-FC/Figures/eigen_cc_dists.tiff;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% CI'€™s on the dists
%CI_l_othercorrs = prctile(othercorrs,5);
%CI_u_othercorrs = prctile(othercorrs,95);
                     
%CI_l_selfcorrs = prctile(selfcorrs,5);
%CI_u_selfcorrs = prctile(selfcorrs,95);

%%% Plot CI'ss
%x = [CI_l_othercorrs,CI_l_othercorrs];
%y = [0, 300];
%plot(x, y);

%x = [CI_u_othercorrs,CI_u_othercorrs];
%y = [0, 300];
%plot(x, y);

%x = [CI_l_selfcorrs,CI_l_selfcorrs];
%y = [0, 300];
%plot(x, y);

%x = [CI_u_selfcorrs,CI_u_selfcorrs];
%y = [0, 300];
%plot(x, y);
