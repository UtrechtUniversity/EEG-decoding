function PSR_setpaths(folderFT, folderCoSMoMVPA, folderLIBSVM)
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
	    addpath(fullfile(folderCoSMoMVPA, 'mvpa'));
	    cosmo_set_path;
	catch
	    error('CoSMoMVPA toolbox not found');
	end
		
	%% libsvm
	try
		addpath(fullfile(folderLIBSVM, 'matlab'));
	catch
		error('libsvm not found');
	end

	%% Custom functions     
	addpath([cd filesep 'helperFun'])
	addpath([cd filesep 'PSRFun'])

end