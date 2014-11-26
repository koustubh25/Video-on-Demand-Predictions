%Clear Screen
clc;

%Clear Variables
clear;

path_location = 'C:/Users/Koustubh/Dropbox/Keio/Research/Video on cloud/general related papers/Gathering Data/';

%%%%%%%%%%%%%%%%
%Client Section
%%%%%%%%%%%%%%%%

%Following is for Modulo-Week

filename = 'Clients/one_week_temporal';
fmt = 'png';

%read Image
image = imread(strcat(path_location,filename),fmt);
client_mod_week = (imageToPlot(image));
figure;
plot(mod_week.*4.5);
xlabel('Days of the Week');
ylabel('Number of Clients');
title('Temporal Behavior of number of active clients:over days');
set(gca,'XTickLabel',{'temp'});

%Following is over entire period

filename = 'Clients/histogram_temporal';
fmt = 'png';

%read Image
image = imread(strcat(path_location,filename),fmt);
client_entire = (imageToPlot(image));
figure;
plot(entire.*9);
xlabel('Time in 15-minute bins');
ylabel('Number of Clients');
title('Temporal Behavior of number of active clients:over entire trace duration');
set(gca,'XTickLabel',{'temp'});

%Following is over each hour

filename = 'Clients/one_day_temporal';
fmt = 'png';

%read Image
image = imread(strcat(path_location,filename),fmt);
client_hourly = (imageToPlot(image));
figure;
plot(hourly.*3/1.23);
xlabel('Time in 15-minute bins');
ylabel('Number of Clients');
title('Temporal Behavior of number of active clients:hourly');
set(gca,'XTickLabel',{'temp'});

