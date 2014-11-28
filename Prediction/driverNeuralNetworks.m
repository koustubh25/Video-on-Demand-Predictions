function driverNeuralNetworks(regionsAndDevices,devices,regions)

%Plot for Devices in all Regions

legend_names={};
temp = length(round(regionsAndDevices('one','computer')));
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
    
    %Setting the X-Axis Labels
    
    set(gca,'Xtick',0:round(temp/7):temp);
    set(gca,'XtickLabel',{'Thursday','Friday','Saturday','Sunday','Monday','Tuesday','Wednesday'});
end

%Narx neural network
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Call NARX Network


output = horzcat(ones(1,100).*108,round(regionsAndDevices('one','computer')));
input = [1:1:(temp + 100)];
[a,e,MSE] = neuralNetworksNARX(input,output);

%If the Predicted value is negative, round it to zero
b = a<0;
a(b)=0;

figure;

plot(output(101:end));

hold all;
plot(round(a(99:end)));
legend('Original Traffic','Neural NARX Network(Prediction)');

%Setting the X-Axis Labels

set(gca,'Xtick',0:round(temp/7):temp);
set(gca,'XtickLabel',{'Thursday','Friday','Saturday','Sunday','Monday','Tuesday','Wednesday'});




%Plot MSE
MSE_narx = [];
err =[];
for i=99:length(e)
    err(end + 1) = e(i);
    MSE_narx(end + 1) = mse(err);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Call Layer Recurrnt Neural Network

[a,e,MSE] = neuralNetworksLayRecNet(input,output);

%If the Predicted value is negative, round it to zero
b = a<0;
a(b)=0;
figure;

plot(output(101:end));

hold all;
plot(round(a(99:end)));
legend('Original Traffic','Layer Recurrent Neural Network(Predicted)');

%Setting the X-Axis Labels

set(gca,'Xtick',0:round(temp/7):temp);
set(gca,'XtickLabel',{'Thursday','Friday','Saturday','Sunday','Monday','Tuesday','Wednesday'});

%Plot MSE
MSE_layrec = [];
err =[];
for i=99:length(e)
    err(end + 1) = e(i);
    MSE_layrec(end + 1) = mse(err);
end
figure;
plot(MSE_narx);
hold all;
plot(MSE_layrec);
legend('NARX','Layer Recurrent Neural Network');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end