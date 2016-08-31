% Sliding window across the EmpTS, each time create EmpFC, and corr this
% time-windowed EmpFC with SC. Returns a list of SC-EmpFC corrs (1 per window), one list per window size, try multiple window sizes 'windows'.
%
% Input: windows: a list of various window sizes in ms. ie windows = [30000, 60000, 120000, 240000, 600000]
%
% Variables of Interest:
%   SC_FC_corrs: a list of corrs of averaged SC-EmpFC corrs across all time
%   windows. # of corrs will = # of EmpFC windows
%
%   Output:
%   SC_FC_corrs_allwindows: an array, each cell represents all SC-EmpFC for a particular window size (ie for all windows in empFC for a particular window size) corrs. ie 1st cell is for 30 sec window, 2nd cell for 60 sec window
%   FC_allwindows: an array, each cell represents the FC3D_Per_Window_empTS for a particular window size
%   FC_allwindows_sum: an array, each cell has a list of summed values of all abs FC matrices for a particular window size
%   FC_allwindows_mean: an array, each cell has a list of meaned values of all abs FC matrices for a particular window

function [SC_FC_corrs, FC_allwindows, FC_allwindows_sum] = SC_EmpFC_SlidingWin(windows)
    
    addpath /Users/jzimmermann/Documents/PHD_Thesis/Python_stuff/My_tvb/Subject_Specificity; % path to TS_To_FC_Per_Window

    SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/EU_20120803_SC.mat/weights.txt']);
    SC = reshape(SC, 68*68,1);
    EmpTS = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/EU_20120803_fMRI_new.mat']);
    EmpTS = EmpTS.fmriTS;
    SC_FC_corrs_allwindows = {};
    FC_allwindows = {};


    for window = 1:length(windows)
        [ FC3D_Per_Window_empTS ] = TS_To_FC_Per_Window( EmpTS, 1940, windows(window), 1 ); %TS, sampling period in ms, window size in ms, step size in time points
        SC_FC_corrs = [];
        FC_sum = [];
        FC_mean = [];
        for m = 1:size(FC3D_Per_Window_empTS,3)
            SC_FC_corrs(end+1) = corr(SC, reshape(FC3D_Per_Window_empTS(:,:,m), 68*68,1));
            FC_sum(end+1) = sum(sum(abs(FC3D_Per_Window_empTS(:,:,m)),1),2);
            FC_mean(end+1) = mean(mean(abs(FC3D_Per_Window_empTS(:,:,m)),1),2);
        end
        
        SC_FC_corrs_allwindows{window} = SC_FC_corrs;
        FC_allwindows{window} = FC3D_Per_Window_empTS; %%
        FC_allwindows_sum{window} = FC_sum;
        FC_allwindows_mean{window}= FC_mean;

    end
   
    
        
    
    
    
    
    