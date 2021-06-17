# ABRanalysis
Heinz Lab Code for ABR analyses, including Artifact removal, Threshold computation, and Peak picking

How to run ABR code from GitHub:

1) Make or choose a folder on your computer. This folder will contain the 
ABR code once you clone it from GitHub

2) Go to https://github.com/HeinzLabPurdue/ABRanalysis and clone the code. 
Use GitHub desktop to clone the code to the folder you chose or created to 
store it.

3) Once the code is cloned, you should see an ?ABRanalysis? folder within 
the folder you chose initially. Open this folder, and you should see several
MATLAB scripts, including scripts called ?abr_setup_format? and ?abr_setup_no_format?.
You will be editing one of these scripts so it can launch the ABR code and 
find all the directories it needs.

4) If you already have a project folder for your ABR data and analysis, 
open ?abr_setup_format? in MATLAB

a) Depending on whether you are using Mac or Windows, use either the top or 
bottom portion of the script (ismac == 1 section for Mac).

b) Replace ?add code directory' with the path of your ?ABRAnalysis? folder 
(the one that was recently cloned), and replace ?add project directory? 
with the path of your project folder.

c) Save and run the script, and the ABR GUI should launch

5) If you do not have a project folder for your ABR data and analysis, 
open ?abr_setup_no_format?

a) Depending on whether you are using Mac or Windows, use either the top or 
bottom portion of the script (ismac == 1 section for Mac).

b) Replace ?add code directory' with the path of your ?ABRAnalysis? folder 
(the one that was recently cloned)

c) Replace ?add data directory? with the path of the folder containing your 
raw data folders

d) Replace ?add output directory? with the path of your output folder 
(or where you want the output to be)

e) Save and run the script, and the ABR GUI should launch


