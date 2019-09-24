function [ds] = PSR_mkCoSMoData(data)
% PSR_MKCOSMODATA Make structure with data arranged in CoSMoMVPA format.
% NB: some hardcoded parameters in this function..!, to be specific:
%   - ds.sa.targets
%   - ds.a.fdim.values{2}

%% .SAMPLES                     
nsensors    = maxsize(data.trial,1);
ntimepoints = maxsize(data.trial,2);
ntrials     = length(data.trial);

% preallocate array
ds.samples = NaN(nsensors,ntimepoints,ntrials);

% fill with data (3D: sensors X timepoints X trials)
for k = 1:ntrials
    ntimepoints_trl = size(data.trial{k},2);
    ds.samples(:,1:ntimepoints_trl,k) = data.trial{k};
end

% organize samples 2D: trials x (sensors x timepoints)
ds.samples = reshape( permute(ds.samples,[3 1 2]), ntrials, nsensors*ntimepoints );

%% .FA (feature attributes)     
% channel number
ds.fa.chan = repmat( 1:nsensors, 1, ntimepoints );

% time point
ds.fa.time = sort( repmat( 1:ntimepoints, 1, nsensors ) );

%% .A (dataset attributes)      
% names of .FA - feature attributes
ds.a.fdim.labels = {'chan','time'};
ds.a.fdim.values = {data.label', round( round(minval(data.time,2),3):1/round(data.fsample):round(maxval(data.time,2),3), 3) };

%% .SA (sample attributes)      
% chunks (assuming all trials are independent)
ds.sa.chunks = [1:ntrials]';

% targets and labels
ds.sa.targets = data.trialinfo(:,8);
index2label = { 'none', 'low', 'high'  };
ds.sa.labels = cellfun(@(x)index2label(x),num2cell(ds.sa.targets+1));

% other sample information
ds.sa.sf     = data.trialinfo(:,8);
ds.sa.cndn   = data.trialinfo(:,5);
ds.sa.fix    = data.trialinfo(:,6);
ds.sa.ori1   = data.trialinfo(:,10);
ds.sa.ori2   = data.trialinfo(:,11);
ds.sa.phase  = data.trialinfo(:,12);
ds.sa.srt    = round( (diff(data.trialinfo(:,16:17),1,2) * 2)/1000, 3);
ds.sa.isrt   = cell2mat( arrayfun(@(k) findnearest(ds.sa.srt(k),ds.a.fdim.values{2}),1:numel(ds.sa.srt),'UniformOutput',false) )';
ds.sa.trlnum = ( 1:size(data.trialinfo,1) )';

% trial type (based on sf, ori and phase)
ds.sa.type = 1 + ...
             ( ds.sa.sf-1 ) * 4 + ...
             ( (ds.sa.ori1)/2+0.5 ) * 2 + ...
             ( ds.sa.phase ) * 1;

if ~any(isnan(ds.sa.type))
    index2label = { 'L_CCW_0', ...
                    'L_CCW_pi', ...
                    'L_CW_0', ...
                    'L_CW_pi', ...
                    'H_CCW_0', ...
                    'H_CCW_pi', ...
                    'H_CW_0', ...
                    'H_CW_pi' };
    ds.sa.typelabels = cellfun(@(x)index2label(x),num2cell(ds.sa.type));
else
    % if no phase labels are present in two subjects
    ds.sa.type = 1 + ...
             ( ds.sa.sf-1 ) * 2 + ...
             ( (ds.sa.ori1)/2+0.5 );
    
    index2label = { 'L_CCW', ...
                    'L_CW', ...
                    'H_CCW', ...
                    'H_CW' };
                
    ds.sa.typelabels = cellfun(@(x)index2label(x),num2cell(ds.sa.type));
end

end
