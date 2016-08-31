% FCD: T1 x T2
% Sliding win along TS, each time generating FC matrix. Corr each of these
% FC matrices with every other FC matrix. T1=T2=#of sliding wins.
%
% Input:
%   TS: EmpTS
%   windows: a list of sliding time window sizes in ms, ie. windows = [30000,60000,120000,240000,600000]
%
% Output:
%   FCD_allwindows: cell array, each cell is a FCD matrix for a particular
%   window size. Ie cell one is an FCD matrix for a 30 sec sliding time
%   window

addpath /Users/jzimmermann/Documents/PHD_Thesis/Python_stuff/My_tvb/Subject_Specificity; % path to TS_To_FC_Per_Window

EmpTS = load(['/Users/jzimmermann/Documents/Thesis/FC-and-SC-data/FC_SC_51subs_April_14/AY_20111004_fMRI_new.mat']);
EmpTS = EmpTS.fmriTS;
%EmpTS = EmpTS(1:80,:);

%simTS = load(['/Volumes/MY_DRIVE/Paul_series2/AA_20120815_SC.mat/cspeed100/csf 0.032/bold.mat']);
%simTS = load(['/Volumes/MY_DRIVE/Paul_series1/AY_20111004_SC_new.mat/cspeed100/csf 0.14/bold.mat']);
%simTS = simTS.arr;
%simTS = squeeze(simTS);
%simTS = simTS(41:end,:); 
%simTS = downsample(simTS,4); % simTS = 80*68

FCD_allwindows = {};

for window = 1:length(windows)
    [ FC3D_Per_Window_empTS ] = TS_To_FC_Per_Window( EmpTS2, 1940, windows(window), 1 ); %TS, sampling period in ms (1940 for emp, 2000 for sim), window size in ms, step size in time points
    
    FCD = zeros(size(FC3D_Per_Window_empTS,3), size(FC3D_Per_Window_empTS,3));
    
    for m = 1:size(FC3D_Per_Window_empTS,3)
        for n = 1:size(FC3D_Per_Window_empTS,3)
           FCD(m,n) = corr(reshape(FC3D_Per_Window_empTS(:,:,m), 68*68,1), reshape(FC3D_Per_Window_empTS(:,:,n), 68*68,1));
        end    
    end        
    
    FCD_allwindows{window} = FCD;
    
end    