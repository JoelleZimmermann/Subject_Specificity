% Sliding window across the EmpTS, each time create EmpFC, and corr this
% time-windowed EmpFC with SC. Take mean of SC-EmpFC corrs across all
% windows.
%
% Output:
%   SC_FC_corrs: a list of corrs of averaged SC-EmpFC corrs across all time
%   windows. # of corrs will = # of EmpFC windows



function [SC_FC_corrs] = SC_EmpFC_SlidingWin()

    addpath /Users/jzimmermann/Documents/PHD_Thesis/Python_stuff/My_tvb/Subject_Specificity; % path to TS_To_FC_Per_Window

    SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/AA_20120815_SC.mat/weights.txt']);
    SC = reshape(SC, 68*68,1);

    EmpTS = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/AA_20120815_fMRI_new.mat']);
    EmpTS = EmpTS.fmriTS;
              
    [ FC3D_Per_Window_empTS ] = TS_To_FC_Per_Window( EmpTS, 1940, 240000, 1 ); %TS, sampling period in ms, window size in ms, step size in time points
    SC_FC_corrs = [];
    for m = 1:size(FC3D_Per_Window_empTS,3)
                  SC_FC_corrs(end+1) = corr(SC, reshape(FC3D_Per_Window_empTS(:,:,m), 68*68,1));
    end
    SC_FC_corr = mean(SC_FC_corrs);
    
    
    
    