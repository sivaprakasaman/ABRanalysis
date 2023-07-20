function replot_data

global 	abr_out_dir freq replot animal abr_Stimuli 


q_fldr = strcat('Q', num2str(animal));
% if strcmp('pre',regexp(abr_Stimuli.dir,'pre','match')) == 1
%     type = 'pre';
% elseif strcmp('post',regexp(abr_Stimuli.dir,'post','match')) == 1
%     type = 'post';
% end
ChinDir = [abr_out_dir,'/', q_fldr];

cd(ChinDir)

d = dir(fullfile(ChinDir, '*.mat'));
d = d(find((strncmp('.',{d.name},1)==0))); % Only files which are not '.' nor '..'
str = {d.name};
[selection ok] = listdlg('Name', 'File Manager', ...
    'PromptString',   'Select data to replot',...
    'SelectionMode',  'single',...
    'ListSize',       [300,300], ...
    'InitialValue',    1, ...
    'ListString',      str);
drawnow; 
sel_file = d(selection).name;
idx = strfind(sel_file,'Hz');
sel_file = sel_file(idx-4:idx-1);
if contains(sel_file,'_')
    sel_freq = sel_file(2:end);
else
    sel_freq = sel_file;
end

if (ok==0 | isempty(selection))
else
	replotfile=str{selection};
	replot = load([strcat(ChinDir, filesep, replotfile)], 'abrs');
	
	if ismember(freq,replot.abrs.thresholds(:,1))
 		replot.abrs.thresholds(replot.abrs.thresholds(:,1)~=freq,:)=[];    
		replot.abrs.z.par(replot.abrs.z.par(:,1)~=freq,:)=[];              
		replot.abrs.z.score(replot.abrs.z.score(:,1)~=freq,:)=[];        
		replot.abrs.amp(replot.abrs.amp(:,1)~=freq,:)=[];                  
		replot.abrs.x(replot.abrs.x(:,1)~=freq,:)=[];                      
		replot.abrs.y(replot.abrs.y(:,1)~=freq,:)=[];                     
		replot.abrs.waves(replot.abrs.waves(:,1)~=freq,:)=[];
        zzz2;
	else
		msgbox(sprintf('Unable to plot previous peaks due to incompatible frequency selection. Try again by plotting %.1f kHz instead',str2num(sel_freq)/1000));
    end
end