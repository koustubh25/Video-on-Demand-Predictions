function [regionsAndDevices] = conv2differentStreamTraffic(data,devices,devices_percent_use,regions,regions_percent_use)
    subplot(2,3,1);

    %Map devices according to their use
    device_perc_users = containers.Map(devices,devices_percent_use);
    
    %Map regions according to their traffic
    region_perc_users = containers.Map(regions,regions_percent_use); 
    
    %Plot the client entire graph
    
    regionsAndDevices = mapn();
    for i=1:length(regions_percent_use)
        for j=1:length(devices_percent_use)
            regionsAndDevices(regions{i},devices{j}) =  data.*(region_perc_users(regions{i}) * device_perc_users(devices{j}));
        end
    end
    
    %regionsAndDevices conatins the ratios
    
    %Following code uses the multidimensional mapping obtained from 
    %http://jp.mathworks.com/matlabcentral/fileexchange/33068-a-multidimensional-map-class
    
end