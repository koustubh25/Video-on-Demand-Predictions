%Clear Screen
clc;

%Clear Variables
clear;
plotlysetup('koustubh25', '11mfn6163z');
path_location = 'C:/Users/Koustubh/Dropbox/Keio/Research/Video on cloud/general related papers/Gathering Data/';

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

plot(client_entire.*9);
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
plot(client_mod_week.*4.5);
xlim([0 length(client_mod_week)]);
xlabel('Time(modulo one week) in 15-minute bins');
ylabel('Number of Clients');
title('Temporal Behavior of number of active clients:over days');
%set(gca,'XTickLabel',{'temp'});



%Following is over each hour

filename = 'Clients/one_day_temporal';
fmt = 'png';

%read Image
image = imread(strcat(path_location,filename),fmt);
client_hourly = (imageToPlot(image));
subplot(2,3,3);
plot(client_hourly.*3/1.23);
xlim([0 length(client_hourly)]);
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
plot(transfer_entire.*9/3);
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
plot(transfer_mod_week.*9/4.65);
xlim([0 length(transfer_mod_week)]);
xlabel('Time(modulo one week) in 15-minute bins');
ylabel('Average Number of Active Transfers/sec');
title('Temporal Behavior of number of Concurrent Transfers:Over Days');
%set(gca,'XTickLabel',{'temp'});


%Following is over one day

filename = 'Transfer/one_day_temporal';
fmt = 'png';

%read Image
image = imread(strcat(path_location,filename),fmt);
transfer_entire = (imageToPlot(image));
subplot(2,3,6);
plot(transfer_entire.*9/(4.65*2.07));
xlim([0 length(transfer_entire)]);
xlabel('Time(modulo 24 hours) in 15-minute bins');
ylabel('Average Number of Active Transfers/sec');
title('Temporal Behavior of number of Concurrent Transfers:Over Days');
%set(gca,'XTickLabel',{'temp'});

fig2plotly();