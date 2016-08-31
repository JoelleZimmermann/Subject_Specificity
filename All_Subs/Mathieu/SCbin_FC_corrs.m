
thresholds = [0,.1,.2,.3,.4,.5,.6,.7,.8,.9];
%thresholds = [0:.01:1];


SCs_thresh = {};

for i = 1:length(thresholds)
    thresh = thresholds(i);
    SC = load(['/Users/jzimmermann/Documents/PHD_Thesis/Pauls_Connectivity_zips/' subsSC{1} '/weights.txt']);
    SC(SC>thresh) = 1;
    SC(SC<thresh) = 0;
    SCs_thresh{i} = SC;

end

% dealing with FC:
    %load empFC of same subj..
empFC = empFC(1:34,1:34);
indexe= triu(true(size(empFC)),1); 
empFC_reshaped = empFC(indexe);

SC_FC_corrs = [];
for j = 1:length(SCs_thresh)
    SC = SCs_thresh{j};
    SC = SC(1:34,1:34);
    indexsc = triu(true(size(SC)),1); 
    SC_reshaped = SC(indexsc);
    SC_FC_corrs(j) = corr(SC_reshaped, empFC_reshaped);
end    

%Notes: For subj 1s FC, simply corr of intrahem raw = .5748, highest thresholded SC bin
%intrahem corr = .4860. (thresh 0.5); mean = .3999
% For subj2s FC, simply corr of intrahem raw = .4969, highest thresholded
% SC bin intrahem corr = .4302 (thresh 0.5); mean = .3493
%For subj 3s FC, imply corr of intrahem raw = .5328, highest thresholded
% SC bin intrahem corr = .4281 (thresh .7); mean = .3793
%For subj 4s FC, simply corr of intrahem raw = .4692, highest thresholded 
% SC bin for intrahem corr = .4231 (thresh .6) mean =.3222
%For subj 22s FC, simply corr of intrahem raw = .5995, highest thresholded 
%SC bin for intrahem corr = .5051 (thresh .4), mean = .4187
    