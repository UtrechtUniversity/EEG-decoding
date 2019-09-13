function PSR_setpaths(folderFT, folderCoSMo)
%% PSR_SETPATHS Set paths to all folder that are required for the analysis
	
	%% Fieldtrip            
	try
		addpath(folderFT);
		ft_defaults;
	catch
		error('FieldTrip folder not found');
	end
		
	%% CoSMoMVPA            
	try
	    %addpath([cd filesep 'CoSMoMVPA' filesep 'mvpa'])
	    %cosmo_set_path;
	catch
	    warning('CoSMoMVPA toolbox not found');
	end

	%% Custom functions     
	addpath([cd filesep 'helperFun'])
	addpath([cd filesep 'PSRFun'])

end