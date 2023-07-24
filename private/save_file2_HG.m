function save_file2

global num freq spl animal date freq_level data abr ABRmag w hearingStatus abr_out_dir abr_Stimuli ...
    AR_marker
today = datetime('now');
today_date = datestr(today);
today_date = today_date(1:11);
prompt_peak_save = sprintf('\nSaving File...\n\nSubject: Q%s \nStimulus: %.1f kHz\n',animal, freq/1000);

filename = strcat('Q',num2str(animal),'_',hearingStatus,'_',date);
q_fldr = strcat('Q', num2str(animal));
ChinDir = [abr_out_dir,'/', q_fldr];

if ~isdir(ChinDir)
    mkdir(ChinDir);
end

cd(ChinDir)



x = dir;
for i = 1:length(x)
    if (~contains(x(i).name,'.'))&&(~contains(x(i).name,'.DS_Store','IgnoreCase',true))
        fldr = x(i).name;
    else
        fldr = '';
    end
end
currChinDir = strcat(ChinDir, fldr);
cd(currChinDir)
if ~isempty(filename)
    
    %HG ADDED 9/30/19
    %Make sure saving is done in correct folder   
    if freq~=0 %HG EDITED 9/30/19
        filename2= strrep(horzcat('Q',num2str(animal),'_',hearingStatus,'_', num2str(freq), 'Hz','_',date), '-', '_');
    else
        filename2= strrep(horzcat('Q',num2str(animal),'_',hearingStatus,'_', 'click','_',date), '-', '_');
    end
    
    freq2=ones(1,num)*freq; replaced=0;
%     file_check = sprintf('*%s_v.mat*',filename2);
    file_check = sprintf('*%s.mat*',filename2);
    temp_file = dir([filename2 '_v' file_check]);
    if isempty(temp_file)
        temp_file = [];
    else
        temp_file = temp_file.name;
    end

    
    if exist(filename2,'file') || exist(temp_file,'file') %Replaces file if file already exists
        load(filename2)
        if exist('abrs','var')
            answer_peak_save = waitbar(0,prompt_peak_save);
            pause(.5)
            close;
            if ismember(freq,abrs.thresholds(:,1))
                abrs.thresholds(abrs.thresholds(:,1)==freq,:)=[];
                abrs.z.par(abrs.z.par(:,1)==freq,:)=[];
                abrs.z.score(abrs.z.score(:,1)==freq,:)=[];
                abrs.amp(abrs.amp(:,1)==freq,:)=[];
                abrs.x(abrs.x(:,1)==freq,:)=[];
                abrs.y(abrs.y(:,1)==freq,:)=[];
                abrs.waves(abrs.waves(:,1)==freq,:)=[];
                replaced=1;
            end
            
            if size(abrs.x,2)<12
                abrs.x=[abrs.x nan(size(abrs.x,1),12-size(abrs.x,2))];
                abrs.y=[abrs.y nan(size(abrs.y,1),12-size(abrs.y,2))];
            end
            waitbar(0.5,answer_peak_save,prompt_peak_save);
            pause(1);
            close;
            abrs.thresholds = [abrs.thresholds; freq data.threshold data.amp_thresh -freq_level];
            abrs.z.par = [abrs.z.par; freq data.z.intercept data.z.slope];
            abrs.z.score = [abrs.z.score; freq2' spl' data.z.score' w'];
            abrs.amp = [abrs.amp; freq2' ABRmag];
            abrs.x = [abrs.x; freq2' spl' data.x'];
            abrs.y = [abrs.y; freq2' spl' data.y'];
            abrs.waves = [abrs.waves; freq2' spl' abr'];
            
            %HG ADDED 2/11/20
            abrs.AR_marker = AR_marker;
            
            save(filename2, 'abrs','-append'); clear abrs;
            filename_out = [filename2 '_' today_date];
        else
            abrs.thresholds = [freq data.threshold data.amp_thresh -freq_level];
            abrs.z.par = [freq data.z.intercept data.z.slope];
            abrs.z.score = [freq2' spl' data.z.score' w'];
            abrs.amp = [freq2' ABRmag];
            abrs.x = [freq2' spl' data.x'];
            abrs.y = [freq2' spl' data.y'];
            abrs.waves = [freq2' spl' abr'];
            save(filename2, 'abrs','-append'); clear abrs;
        end
    elseif  ~isempty(data) %Creates new file because no file currently exists
        answer_peak_save = waitbar(0,prompt_peak_save);
        pause(.5);
        close;
        abrs.thresholds = [freq data.threshold data.amp_thresh -freq_level];
        abrs.z.par = [freq data.z.intercept data.z.slope];
        abrs.z.score = [freq2' spl' data.z.score' w'];
        abrs.amp = [freq2' ABRmag];
        abrs.x = [freq2' spl' data.x'];
        abrs.y = [freq2' spl' data.y'];
        abrs.waves = [freq2' spl' abr'];
        file_check = dir(sprintf('*%s_v*.mat',filename2));
        [~,c] = size({file_check.name});
        if ~isempty(file_check)
            file_num = c + 1;
            filename3 = sprintf('%s_v%d',filename2,file_num);
            while exist(sprintf('*%s_v*.mat',filename2),'file')
                filename3 = strcat(filename2, '_v', file_num);
                file_num = file_num + 1;
            end
            filename_out = [filename3 '_' today_date];
            save(filename_out,'abrs');
            filename_out = [filename3 '_' today_date];
        elseif ~exist(strcat(filename2, '.mat'),'file')
            filename_out = [filename2 '_v1_' today_date];
            save(filename_out, 'abrs');
            clear abrs;
        end
        %HG ADDED 2/11/20
        abrs.AR_marker = AR_marker;   
        answer_peak_save = waitbar(0.5,prompt_peak_save);
        pause(.5);
        close;
    else
        waitbar(0,sprintf('\nExiting ABR Analysis\n\nGood Bye n.n'));
        close;
        return;
    end
saved_prompt = sprintf('\nFiles Saved!\n\nFilename: %s\nFolder: %s',filename_out,currChinDir);
saved_box = waitbar(1,saved_prompt); set(get(get(saved_box, 'CurrentAxes'), 'title'), 'Interpreter', 'none');
end