function driverNeuralNetworks(regionsAndDevices,devices,regions)

%Plot for Devices in all Regions
window_size = 24;


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
   % set(gca,'XtickLabel',{'Thursday','Friday','Saturday','Sunday','Monday','Tuesday','Wednesday'});
end

%Narx neural network
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Call NARX Network


output = horzcat(ones(1,100).*108,round(regionsAndDevices('one','computer')));


%input = movingstat(transpose(output),window_size,@sum);
%input = [ones(window_size - 1,1).*108 ; input];

%%%%%%%%%%%%%%%%
%Stddev
%%%%%%%%%%%%%%%
%input = movingstd(transpose(output),window_size);

%input = transpose(input);


%Combination of all features - mean, median,stddev and InterArrival Time
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

meanCurve = transpose([ones(window_size - 1,1).*108 ;movingstat(transpose(output),window_size,@mean)]);
medianCurve = transpose([ones(window_size - 1,1).*108 ;movingstat(transpose(output),window_size,@median)]);
sumCurve = transpose([ones(window_size - 1,1).*108 ;movingstat(transpose(output),window_size,@sum)]);
stddevCurve = transpose(movingstd(transpose(output),window_size));
interArrivalTime = interarrivalTime('Transfer/one_day_temporal');

interArrivalTime = horzcat(ones(1,(length(output) - length(interArrivalTime))), interArrivalTime);



input = [ meanCurve ; medianCurve ; sumCurve ; stddevCurve ; interArrivalTime ];

%input = [1:1:(temp + 100)];
[a,e,MSE] = neuralNetworksNARX(input,output);

%If the Predicted value is negative, round it to zero
b = a<0;
a(b)=0;

figure;

plot(output(101:end));

hold all;
plot(round(a(99:end)),'--');


%plot(round(input(101:end)))

legend('Original Traffic','Neural NARX Network (Prediction)');

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

rng(1914819610,'v5normal');

%Call Layer Recurrnt Neural Network
%input = [1:1:(temp + 100)];
[a,e,MSE] = neuralNetworksLayRecNet(input,output);

%If the Predicted value is negative, round it to zero
b = a<0;
a(b)=0;
figure;

plot(output(101:end));

hold all;
plot(round(a(99:end)),'--');
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
fig2plotly();

%X-Axis Labels
set(gca,'Xtick',0:round(temp/7):temp);
set(gca,'XtickLabel',{'Thursday','Friday','Saturday','Sunday','Monday','Tuesday','Wednesday'});

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('\n NARX MSE mean %f',mean(MSE_narx));
fprintf('\n LRN MSE mean %f\n',mean(MSE_layrec));


end