function driverNeuralNetworks(regionsAndDevices,devices,regions)

%Plot for Devices in all Regions

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
end


%Call NARX Network

temp = length(round(regionsAndDevices('one','computer')));
output = horzcat(ones(1,100).*108,round(regionsAndDevices('one','computer')));
input = [1:1:(temp + 100)];
[a,e,MSE] = neuralNetworksNARX(input,output);
figure;

plot(output(101:end));
size(output)
size(input)
size(a)
hold all;
plot(round(a(99:end)));
legend('Original Network','Neural NARX Network');

%fig2plotly();


%Plot MSE
MSE = [];
err =[];
for i=99:length(e)
    err(end + 1) = e(i);
    MSE(end + 1) = mse(err);
end
figure;
plot(MSE);
end