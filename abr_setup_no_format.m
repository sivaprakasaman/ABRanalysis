function abr_setup_no_format
% Follow instructions in Readme.txt if having trouble setting up
% Use this setup if you do not have a correctly formatted project folder

global abr_root_dir abr_data_dir abr_out_dir

addpath(genpath(pwd)) %ENTER the path of the directory containing your 'ABRAnalysis' folder
addpath(genpath('/media/sivaprakasaman/AndrewNVME/Pitch_Study/Pitch_Diagnostics_SH_AS/ABR/Chin/')) %ENTER the path of the directory containing your project folder
code_DIR=[pwd,'/']; %ENTER the path of your 'ABRAnalysis' folder
project_DIR='/media/sivaprakasaman/AndrewNVME/Pitch_Study/Pitch_Diagnostics_SH_AS/ABR/Chin/Baseline/'; %ENTER the path of your project folder

abr_root_dir = [code_DIR 'ABR-master/Matlab_ABR/'];

abr_data_dir = [project_DIR ''];
abr_out_dir = [project_DIR 'Analysis/ABR/'];

addpath([abr_root_dir 'ABR_analysis/'])
cd([abr_root_dir 'ABR_analysis/'])

abr_analysis_HL

