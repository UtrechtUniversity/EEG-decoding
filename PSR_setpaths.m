function PSR_setpaths
%% PSR_SETPATHS Set paths to all folder that are required for the analysis

%% Fieldtrip            
% determine environment using fieldtrip folder
%ft_folder = 'C:\Program Files\fieldtrip-20171028'; %-------------- Rovereto
%if ~exist(ft_folder,'dir')
%    ft_folder = '/home/jasper.fabius/fieldtrip-20171114'; %--- Trentobomber
%end
%if ~exist(ft_folder,'dir')
%    ft_folder = 'C:\Program Files\fieldtrip-20170918'; %------------ Laptop
%end
%if ~exist(ft_folder,'dir')
%    ft_folder = 'C:\Users\Jasper\Documents\fieldtrip-20171221'; %-- Utrecht
%end
%if ~exist(ft_folder,'dir')
%    ft_folder = '\\storage.fss.uu.nl\pf_researchdata$\Leerstoel Postma\Jasper Fabius\serverC_document\fieldtrip-20180129'; %-- Utrecht server
%end
%if ~exist(ft_folder,'dir')
%    error('FieldTrip folder not found');
%end

% add path
%addpath(ft_folder)
addpath([cd filesep 'FieldTrip'])
ft_defaults;

%% Cimec FieldTrip
% cimecft_folder = '\\storage.fss.uu.nl\pf_researchdata$\Leerstoel Postma\Jasper Fabius\serverC_document\cimec_ownft'; % Utrecht server
% if exist(cimecft_folder,'dir')
%     addpath(cimecft_folder)
% end

%% CoSMoMVPA            
try
    %addpath('\\storage.fss.uu.nl\pf_researchdata$\Leerstoel Postma\Jasper Fabius\serverC_document\CoSMoMVPA\mvpa');
    addpath([cd filesep 'CoSMoMVPA' filesep 'mvpa'])
    cosmo_set_path;
catch
    warning('CoSMoMVPA toolbox not found');
end

%% Custom functions     
addpath([cd filesep 'helperFun'])
addpath([cd filesep 'PSRFun'])

end