function driverNeuralNetworks(regionsAndDevices,devices,regions)

%Plot for Devices in Region - I

legend_names={};
figure;
for j=1:length(regions)
subplot(2,1,j);
for i=1:length(devices)
    plot(round(regionsAndDevices(regions{j},devices{i})));
    hold all;
    %Legend Names
    legend_names{i} = devices{i} ;
end
title(strcat('Region-',regions{j}));
xlabel('Days of the Week');
ylabel('Number of Active Transfers/sec');
hold off;
legend(legend_names);
%Try this for NARX Network

end


fig2plotly();
end