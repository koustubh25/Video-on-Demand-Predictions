function driverNeuralNetworks(regionsAndDevices,devices,regions)

%Plot for Devices in Region - I
figure;
legend_names={};
for i=1:length(devices)
    plot(round(regionsAndDevices('one',devices{i})));
    hold all;
    
    %Legend Names
    legend_names{i} = devices{i} ;
end
hold off;
legend(legend_names);
%Try this for NARX Network


end