function abr_setup_no_format
% Follow instructions in Readme.txt if having trouble setting up
% Use this setup if you do not have a correctly formatted project folder

global abr_root_dir abr_data_dir abr_out_dir
if (ismac == 1) %Use if using a MAC
    addpath(genpath('Add code directory')) %ENTER the path of the directory containing your 'ABRAnalysis' folder
    addpath(genpath('Add data directory')) %ENTER the path of the data directory
    addpath(genpath('Add output directory')) %ENTER the path of the output directory
    code_DIR='Add code directory'; %ENTER the path of your 'ABRAnalysis' folder

    abr_root_dir = [code_DIR 'ABR-master/Matlab_ABR/'];
    abr_data_dir = 'Add data folders path'; %ENTER the path containing your Data folders 
    abr_out_dir = 'Add output path'; %ENTER the path of your output directory

    addpath([abr_root_dir 'ABR_analysis/'])
    cd([abr_root_dir 'ABR_analysis/'])
    
    
else %Use if using Windows/Linux
    addpath(genpath('Z:\Projects\Ivy_Andrew_CARBOvTTS\Code_Archive\ABRanalysis-master')) %ENTER the path of the directory containing your 'ABRAnalysis' folder
    addpath(genpath('Z:\Projects\Ivy_Andrew_CARBOvTTS\Data')) %ENTER the path of the directory containing your project folder
    code_DIR='Z:\Projects\Ivy_Andrew_CARBOvTTS\Code_Archive\ABRanalysis-master\'; %ENTER the path of your 'ABRAnalysis' folder
    project_DIR='Z:\Projects\Ivy_Andrew_CARBOvTTS\Data'; %ENTER the path of your project folder

%     addpath(genpath('C:\Users\ischwein\Desktop\For_Purdue_Labs\Heinz_LabData\Code_Archive\ABRanalysis-master')) %ENTER the path of the directory containing your 'ABRAnalysis' folder
%     addpath(genpath('C:\Users\ischwein\Desktop\For_Purdue_Labs\Heinz_LabData\Data')) %ENTER the path of the directory containing your project folder
%     code_DIR='C:\Users\ischwein\Desktop\For_Purdue_Labs\Heinz_LabData\Code_Archive\ABRanalysis-master\ABR-master'; %ENTER the path of your 'ABRAnalysis' folder
%     project_DIR='C:\Users\ischwein\Desktop\For_Purdue_Labs\Heinz_LabData\Data'; %ENTER the path of your project folder

    abr_root_dir = [code_DIR 'ABR-master\Matlab_ABR\'];
    
    abr_data_dir = [project_DIR 'Data\'];
    abr_out_dir = [project_DIR 'Analysis\ABR\'];
    
    addpath([abr_root_dir 'ABR_analysis\'])
    cd([abr_root_dir 'ABR_analysis\'])
end

abr_analysis_HL

