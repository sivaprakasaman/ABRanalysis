%CREATING STRUCTURES HERE
push = cell2struct(cell(1,4),{'process','print','close','edit'},2);
ax1  = cell2struct(cell(1,7),{'axes','line1','line2','line3','xlab','ylab','title'},2);
ax2  = cell2struct(cell(1,3),{'axes','xlab','ylab'},2);
abrs  = cell2struct(cell(1,10),{'abr1','abr2','abr3','abr4','abr5','abr6','abr7','abr8','abr9','abr10'},2);
abr_FIG = struct('handle',[],'push',push,'ax1',ax1,'ax2',ax2,'abrs',abrs,'parm_text',[],'dir_text',[]);

abr_Stimuli = struct('cal_pic','1', ...
	'abr_pic','27-33,37', ...
	'start', 0.00, ...
	'end',20.00, ...
	'start_template', 2.50, ...
	'end_template',7.50, ...
	'num_templates', 2.00, ...
	'dir','Click Here to Select!',...
    'maxdB2analyze',80);
%Changed to 80 by HG on 11/25/19

if ~exist('abr_Stimuli','var')||~isfield(abr_Stimuli, 'cal_pic')
    instruct_error;
end

abr_FIG.handle = figure('NumberTitle','off','Name','ABR peaks','Units','normalized','Visible','on',...
    'position',[0 0.03 1 0.92],'outerposition',[0 0 1 1],'CloseRequestFcn','abr_analysis_HL(''close'');');
% colordef none;
whitebg('w');

%Modify weights push button
han.change_weights = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''change_weights'');','style','pushbutton','Units','normalized','position',[0.07 0.86 0.07 0.02],'string','modify weights');

%Average waves checkbox
%han.cbh2 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''cbh2'');','style','checkbox','Units','normalized','position',[0.35 .35 0.1 .03],'String','Average waves','Value',0,'BackgroundColor','w');

%Load previous ABR peaks push button
abr_FIG.push.peaks = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''peaks'');','style','pushbutton','Units','normalized','position',[0.35 .355 0.12 .03],'string','Load Previous Peaks');

%Load ABR files push button
abr_FIG.push.process = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''process'');','style','pushbutton','Units','normalized','position',[0.35 .32 0.1 .03],'string','Load ABR files');

%Show ref data push button
abr_FIG.push.refdata = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''refdata'');','style','pushbutton','Units','normalized','position',[0.35 .285 0.08 .03],'string','Show ref data');

%waves checkbox
%han.cbh = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''cbh'');','style','checkbox','Units','normalized','position',[0.44 .285 0.05 .03],'String','waves','Value',0,'BackgroundColor','w');

%invert checkbox
han.invert = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''invert'');','style','checkbox','Units','normalized','position',[0.44 .25 0.05 .03],'String','invert','Value',0,'BackgroundColor','w');

%Next push button
abr_FIG.push.nextPics = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''nextPics'');','style','pushbutton','Units','normalized','position',[0.3 0.32 0.02125 0.03],'string','Nxt');

%P1-P5, N1-N5 push buttons
abr_FIG.push.peak1 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''peak1'');','style','togglebutton','Units','normalized','position',[0.35 0.21 0.02125 0.03],'string','P(1)');
abr_FIG.push.trou1 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''trou1'');','style','togglebutton','Units','normalized','position',[0.35 0.175 0.02125 0.03],'string','N(1)');
abr_FIG.push.peak2 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''peak2'');','style','togglebutton','Units','normalized','position',[0.37625 0.21 0.02125 0.03],'string','P(2)');
abr_FIG.push.trou2 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''trou2'');','style','togglebutton','Units','normalized','position',[0.37625 0.175 0.02125 0.03],'string','N(2)');
abr_FIG.push.peak3 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''peak3'');','style','togglebutton','Units','normalized','position',[0.40125 0.21 0.02125 0.03],'string','P(3)');
abr_FIG.push.trou3 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''trou3'');','style','togglebutton','Units','normalized','position',[0.40125 0.175 0.02125 0.03],'string','N(3)');
abr_FIG.push.peak4 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''peak4'');','style','togglebutton','Units','normalized','position',[0.4275 0.21 0.02125 0.03],'string','P(4)');
abr_FIG.push.trou4 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''trou4'');','style','togglebutton','Units','normalized','position',[0.4275 0.175 0.02125 0.03],'string','N(4)');
abr_FIG.push.peak5 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''peak5'');','style','togglebutton','Units','normalized','position',[0.45 0.21 0.02125 0.03],'string','P(5)');
abr_FIG.push.trou5 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''trou5'');','style','togglebutton','Units','normalized','position',[0.45 0.175 0.02125 0.03],'string','N(5)');

%Autofind push button
%abr_FIG.push.autofind = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''autofind'');','style','pushbutton','Units','normalized','position',[0.35 0.14 0.1 0.03],'string','AutoFind');

%HG ADDED 2/5/20
%Commented out 2/14/20
%Artifact Rejection
%Average and subtract three lowest levels push button
%abr_FIG.push.artifactrejection = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''artifactrejection'');','style','pushbutton','Units','normalized','position',[0.35 0.14 0.1 0.03],'string','Artifact Rejection');
%HG ADDED 2/25/20 -- "view raw data" checkbox
han.viewraw = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''viewraw'');','style','checkbox','Units','normalized','position',[0.35 0.14 0.1 0.03],'String','View raw data','Value',0,'BackgroundColor','w');
%han.invert = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''invert'');','style','checkbox','Units','normalized','position',[0.44 .25 0.05 .03],'String','invert','Value',0,'BackgroundColor','w');



%Print push button
abr_FIG.push.print   = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''print'');','style','pushbutton','Units','normalized','position',[0.35 0.085 0.1 0.03],'string','Print');

%Save as file push button
abr_FIG.push.file   = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''file'');','style','pushbutton','Units','normalized','position',[.35 0.05 0.1 0.03],'string','Save as File');

%Edit text box
abr_FIG.push.edit    = uicontrol(abr_FIG.handle,'style','edit', 'callback', 'abr_analysis_HL(''edit'');','Units','normalized','position',[.22 .05 .1 .04],'string','','FontSize',12);

axes('Position',[0 0 1 1]); 
axis off;
text(0.34,0.255,'Mark peaks:','Fontsize',10,'horizontalalignment','left','VerticalAlignment','middle')
text(0.73,0.03,'Time (ms)','FontSize',12,'horizontalalignment','center','VerticalAlignment','middle','color','k')
text(0.27,0.40,'dB SPL','FontSize',12,'horizontalalignment','center','VerticalAlignment','middle','color','k')
text(0.5-0.02*0.33,0.94,'dB SPL','FontSize',10,'horizontalalignment','left','VerticalAlignment','middle','color','b')
text(0.5+0.92*0.33,0.94,'(attn)','FontSize',10,'horizontalalignment','left','VerticalAlignment','middle','color','k')

axes('Position',[0 0.07 0.35 0.4]);
axis('off');
text(.2,.65,'Directory:','fontsize',10,'color','k','horizontalalignment','left','VerticalAlignment','middle');
text(.2,.58,'Inverse Calibration File:','fontsize',10,'color','k','horizontalalignment','left','VerticalAlignment','middle');

text(.2,.43,'ABR Files:','fontsize',10,'color','k','horizontalalignment','left','VerticalAlignment','middle');
text(.2,.37,'Zoom left (ms):','fontsize',10,'color','k','horizontalalignment','left','VerticalAlignment','middle');
text(.2,.32,'Zoom Right (ms):','fontsize',10,'color','k','horizontalalignment','left','VerticalAlignment','middle');
text(.2,.24,'Template left (ms):','fontsize',10,'color','k','horizontalalignment','left','VerticalAlignment','middle');
text(.2,.19,'Template right (ms):','fontsize',10,'color','k','horizontalalignment','left','VerticalAlignment','middle');
text(.2,.09,'N of templates:','fontsize',10,'color','k','horizontalalignment','left','VerticalAlignment','middle');

abr_FIG.parm_txt(1)  = text(.8,.58,num2str(abr_Stimuli.cal_pic),   'fontsize',10,'color','b','horizontalalignment','right','buttondownfcn','abr_analysis_HL(''stimulus'',1);');
abr_FIG.parm_txt(2)  = text(.8,.43,num2str(abr_Stimuli.abr_pic),   'fontsize',10,'color','b','horizontalalignment','right','buttondownfcn','abr_analysis_HL(''stimulus'',2);');
abr_FIG.parm_txt(3)  = text(.8,.37,num2str(abr_Stimuli.start),'fontsize',10,'color','b','horizontalalignment','right','buttondownfcn','abr_analysis_HL(''stimulus'',3);');
abr_FIG.parm_txt(4)  = text(.8,.32,num2str(abr_Stimuli.end),  'fontsize',10,'color','b','horizontalalignment','right','buttondownfcn','abr_analysis_HL(''stimulus'',4);');
abr_FIG.parm_txt(5)  = text(.8,.24,num2str(abr_Stimuli.start_template),'fontsize',10,'color','b','horizontalalignment','right','buttondownfcn','abr_analysis_HL(''stimulus'',5);');
abr_FIG.parm_txt(6)  = text(.8,.19,num2str(abr_Stimuli.end_template),  'fontsize',10,'color','b','horizontalalignment','right','buttondownfcn','abr_analysis_HL(''stimulus'',6);');
abr_FIG.parm_txt(7)  = text(.8,.09,num2str(abr_Stimuli.num_templates),     'fontsize',10,'color','b','horizontalalignment','right','buttondownfcn','abr_analysis_HL(''stimulus'',7);');
abr_FIG.dir_txt = text(.8,.65,abr_Stimuli.dir,'fontsize',10,'color','r','horizontalalignment','right','buttondownfcn','abr_analysis_HL(''directory'');','Interpreter','none');

set(abr_FIG.handle,'Userdata',struct('handles',abr_FIG));

%% Added by SP
freq_load.x= .3;
freq_load.width= .02125;
freq_load.height= .025;

abr_FIG.push.freq500 = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''freq_proc500'',0.5);','style','togglebutton','Units','normalized','position',...
    [freq_load.x 0.28 freq_load.width freq_load.height],'string','500Hz');
abr_FIG.push.freq1k = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''freq_proc1k'',1);','style','togglebutton','Units','normalized','position',...
    [freq_load.x 0.245 freq_load.width freq_load.height],'string','1kHz');
abr_FIG.push.freq2k = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''freq_proc2k'',2);','style','togglebutton','Units','normalized','position',...
    [freq_load.x 0.21 freq_load.width freq_load.height],'string','2kHz');
abr_FIG.push.freq4k = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''freq_proc4k'',4);','style','togglebutton','Units','normalized','position',...
    [freq_load.x 0.175 freq_load.width freq_load.height],'string','4kHz');
abr_FIG.push.freq8k = uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''freq_proc8k'',8);','style','togglebutton','Units','normalized','position',...
    [freq_load.x 0.14 freq_load.width freq_load.height],'string','8kHz');
abr_FIG.push.freqClick= uicontrol(abr_FIG.handle,'callback','abr_analysis_HL(''freq_procClick'',0);','style','togglebutton','Units','normalized','position',...
    [freq_load.x 0.105 freq_load.width freq_load.height],'string','Click');

text(.2,.5,'Max dB to analyze:','fontsize',10,'color','k','horizontalalignment','left','VerticalAlignment','middle');
abr_FIG.parm_txt(8)  = text(.8,.5,num2str(abr_Stimuli.maxdB2analyze),'fontsize',10,'color','b','horizontalalignment','right','buttondownfcn','abr_analysis_HL(''stimulus'',8);');

%%
axes('Position',[0.50 0.07 0.33 0.86]); 
han.abr_panel=gca;
title('ABR waveform','FontSize',14)
ylabel('Tick interval = 0.5 uV','fontsize',12);

axes('Position',[0.50 0.07 0.33 0.86]); 
han.peak_panel=gca;

axes('Position',[0.86 0.07 0.1 0.86]); 
han.xcor_panel=gca;
title('XCORR function','FontSize',14)

axes('Position',[0.06 0.44 0.17 0.22]); 
han.amp_panel=gca;
ylabel('P-P amplitude (uV)','FontSize',12)

axes('Position',[0.06 0.71 0.17 0.22]); 
han.z_panel=gca;
ylabel('Z score','FontSize',12)

axes('Position',[0.275 0.44 0.17 0.49]); 
han.lat_panel=gca;
ylabel('Latency (ms)','FontSize',12)

axes('Position',[0 0 1 1]); han.text_panel=gca; 
axis(han.text_panel,'off',[0 1 0 1]);

drawnow;
