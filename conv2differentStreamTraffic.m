function [regionsAndDevices] = conv2differentStreamTraffic(data)
    subplot(2,3,1);
    %Divide based on Devices
    
    devices = {'smartphone','connected_tv','tablet','computer','other'};
    devices_percent_use = [0.11,0.13,0.22,0.33,0.21];
    
    %Map devices according to their use
    device_perc_users = containers.Map(devices,devices_percent_use);
    
    %Consider Regions first
    regions = {'one','two'};
    regions_percent_use = [0.7,0.3];
    
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