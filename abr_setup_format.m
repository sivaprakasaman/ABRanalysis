function abr_setup_format
% Follow instructions in Readme.txt if having trouble setting up
% Only use this setup script if you have a correctly formatted project folder

global abr_root_dir abr_data_dir abr_out_dir
if (ismac == 1) %Use if using a MAC
    addpath(genpath('Add code directory')) %ENTER the path of the directory containing your 'ABRAnalysis' folder
    addpath(genpath('Add project directory')) %ENTER the path of the directory containing your project folder
    code_DIR='Add code directory'; %ENTER the path of your 'ABRAnalysis' folder
    project_DIR='Add project directory'; %ENTER the path of your project folder

    abr_root_dir = [code_DIR 'ABR-master/Matlab_ABR/'];
    abr_data_dir = [project_DIR 'Data/'];
    abr_out_dir = [project_DIR 'Analysis/ABR/'];

    addpath([abr_root_dir 'ABR_analysis/'])
    cd([abr_root_dir 'ABR_analysis/'])
    
    
else %Use if using Windows/Linux
    addpath(genpath('C:\Users\ischwein\Desktop\For_Purdue_Labs\Heinz_LabData')) %ENTER the path of the directory containing your 'ABRAnalysis' folder
    addpath(genpath('Z:\Projects')) %ENTER the path of the directory containing your project folder
    code_DIR='Z:\Projects\Ivy_Andrew_CARBOvTTS\Code Archive\ABRanalysis-master'; %ENTER the path of your 'ABRAnalysis' folder
    project_DIR='Z:\Projects\Ivy_Andrew_CARBOvTTS\'; %ENTER the path of your project folder

    abr_root_dir = [code_DIR '\ABR-master\Matlab_ABR\'];
    
    abr_data_dir = [project_DIR 'Data\'];
    abr_out_dir = [project_DIR 'Analysis\ABR\'];
    
    addpath([abr_root_dir 'ABR_analysis\'])
    cd([abr_root_dir 'ABR_analysis\'])
end

abr_analysis_HL

