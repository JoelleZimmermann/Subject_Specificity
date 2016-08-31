
% Autism dataset 35 subs:
subsSC = {'145', '144', '143', '142', '140_CCN', '139_CCN', '138_CCN', '137', '136_CCN', '135', '134_CCN', '133B_CCN', '132_CCN', '131B', '130B', '128B', '126B', '125B', '124B', '123B', '122B', '120B', '118B', '114B', '113B', '112B', '111B', '108B', '107B', '105B', '103', '102B', '101', '100B', '86C'};
subsFC = {'145', '144', '143', '142', '140_CCN', '139_CCN', '138B_CCN', '137', '136_CCN', '135', '134_CCN', '133_CCN', '132_CCN', '131', '130B', '128', '126', '125', '124', '123', '122', '120', '118', '114', '113B', '112B', '111B', '108B', '107B', '105', '103B', '102B', '101B', '100C', '86C'};


SC3D = [];
FC3D = [];

for i= 1:length(subsSC)
    empFC = load(['/Users/jzimmermann/Documents/PHD_Thesis/UCLA_Autism/TD' subsFC{i} '_rsfMRI_connectivity_matrix_file.txt']);
    % Remove inf from FC diags:
    empFC(isinf(empFC)) = 1;
   
    SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/UCLA_Autism/TD' subsSC{i} '_DTI_connectivity_matrix_file.txt']);
    % normalize SCs
    weights = log10(SC+1); % log of matrix  %+1 to not have "-Inf" values after log
    weights = weights/(max(max(weights))); % norm the Matrix to its highest value
    
    
    SC3D(:,:,i) = weights;
    FC3D(:,:,i) = empFC;
    
end