%Clear Screen
clc;

%Clear Variables
clear;

rng default;


%rng('shuffle');

plotlysetup('koustubh25', '11mfn6163z');
path_location = 'C:/Users/Koustubh/Dropbox/Keio/Research/Video on cloud/general related papers/Gathering Data/';

%Supress Figures temporarily
set(gcf,'Visible','on')              % turns current figure "off"
set(0,'DefaultFigureVisible','on');


%%%%%%%%%%%%%%%%
%Client Section
%%%%%%%%%%%%%%%%

%Following is over entire period

filename = 'Clients/histogram_temporal';
fmt = 'png';

%read Image
image = imread(strcat(path_location,filename),fmt);
client_entire = (imageToPlot(image));
subplot(2,3,1);
client_entire = client_entire.*9;
plot(client_entire);
xlim([0 length(client_entire)]);
xlabel('Time in 15-minute bins');
ylabel('Number of Clients');
title('Temporal Behavior of number of active clients:Entire trace duration');
%set(gca,'XTickLabel',{'temp'});

%Following is for Modulo-Week

filename = 'Clients/one_week_temporal';
fmt = 'png';

%read Image
image = imread(strcat(path_location,filename),fmt);
client_mod_week = (imageToPlot(image));
subplot(2,3,2);
client_mod_week = client_mod_week.*4.5;
plot(client_mod_week);
xlim([0 length(client_mod_week)]);
xlabel('Time(modulo one week) in 15-minute bins');
ylabel('Number of Clients');
title('Temporal Behavior of number of active clients:over days');

%Setting the X-Axis Labels
set(gca,'Xtick',0:round(length(client_mod_week)/7):length(client_mod_week));
set(gca,'XtickLabel',{'Thur','Fri','Sat','Sun','Mon','Tue','Wed'});



%Following is over each hour

filename = 'Clients/one_day_temporal';
fmt = 'png';

%read Image
image = imread(strcat(path_location,filename),fmt);
client_hour = (imageToPlot(image));
subplot(2,3,3);
client_hour = client_hour.*3/1.23;
plot(client_hour);
xlim([0 length(client_hour)]);
xlabel('Time(modulo 24 hours) in 15-minute bins');
ylabel('Number of Clients');
title('Temporal Behavior of number of active clients:hourly');
%set(gca,'XTickLabel',{'temp'});

%%%%%%%%%%%%%%%%%
%Transfer Section
%%%%%%%%%%%%%%%%%%%


%Following is over entire period

filename = 'Transfer/histogram_temporal';
fmt = 'png';

%read Image
image = imread(strcat(path_location,filename),fmt);
transfer_entire = (imageToPlot(image));
subplot(2,3,4);
transfer_entire = transfer_entire.*9/3;
plot(transfer_entire);
xlim([0 length(transfer_entire)]);
xlabel('Time in 15-minute bins');
ylabel('Average Number of Active Transfers/sec');
title('Temporal Behavior of number of Concurrent Transfers:Over Entire Trace');
%set(gca,'XTickLabel',{'temp'});


%Following is over one week

filename = 'Transfer/one_week_temporal';
fmt = 'png';

%read Image
image = imread(strcat(path_location,filename),fmt);
transfer_mod_week = (imageToPlot(image));
subplot(2,3,5);
transfer_mod_week = transfer_mod_week.*9/4.65;
plot(transfer_mod_week);
xlim([0 length(transfer_mod_week)]);
xlabel('Time(modulo one week) in 15-minute bins');
ylabel('Average Number of Active Transfers/sec');
title('Temporal Behavior of number of Concurrent Transfers:Over Days');

%Setting the X-Axis Labels
set(gca,'Xtick',0:round(length(transfer_mod_week)/7):length(transfer_mod_week));
set(gca,'XtickLabel',{'Thur','Fri','Sat','Sun','Mon','Tue','Wed'});

%Following is over one day

filename = 'Transfer/one_day_temporal';
fmt = 'png';

%read Image
image = imread(strcat(path_location,filename),fmt);
transfer_hour = (imageToPlot(image));
subplot(2,3,6);
transfer_hour = transfer_hour.*9/(4.65*2.07);
plot(transfer_hour);
xlim([0 length(transfer_hour)]);
xlabel('Time(modulo 24 hours) in 15-minute bins');
ylabel('Average Number of Active Transfers/sec');
title('Temporal Behavior of number of Concurrent Transfers:Over Days');

%set(gca,'XTickLabel',{'temp'});

%Initialization Part
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Divide the Traffic based on Regions and Devices

%Divide based on Devices

devices = {'smartphone','connected tv','tablet','computer','other'};
devices_percent_use = [0.11,0.13,0.22,0.33,0.21];

%Consider Regions 
regions = {'one','two'};
regions_percent_use = [0.7,0.3];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[regionsAndDevices] = conv2differentStreamTraffic(transfer_mod_week,devices,devices_percent_use,regions,regions_percent_use);
driverNeuralNetworks(regionsAndDevices,devices,regions);


