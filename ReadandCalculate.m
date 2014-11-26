%Clear Screen
clc;

%Clear Variables
clear;

path_location = 'C:/Users/Koustubh/Dropbox/Keio/Research/Video on cloud/general related papers/Gathering Data/';
filename = 'Clients/histogram_temporal';
fmt = 'png';


plot(imageToPlot(strcat(path_location,filename),fmt));

