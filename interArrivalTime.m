function interArrivalTime(filename)
    path_location = 'C:/Users/Koustubh/Dropbox/Keio/Research/Video on cloud/general related papers/Gathering Data/';
    
    fmt = 'png';


    event = distros('reality_show');
    y = pareto_own(event,2.54,0.989,7);
    
    %initialise days to these values
    days = {'Wednesday','Thursday','Tuesday','Friday','Monday','Saturday','Sunday'};
    interArrivalRatio = containers.Map(days,y);
    
    %Consider Wednesday as one unit, scan the one day image and then
    %multiple with Ratios wrt to Wednesday
    
    image = imread(strcat(path_location,filename),fmt);
    one_day_temporal = (imageToPlot(image));   
    
    one_day_temporal_new = [];
    
    %Reduce the horizontal resolution so that it fits for one day in the
    %Week Diagram
    for i=1:7:length(one_day_temporal)
        one_day_temporal_new(end + 1) = one_day_temporal(i);
    end
    
    %Now Multiply with the ratio values - for Wednesday it remains exactly
    %the same
    
    day_values = mapn();
    
    for i=1:length(days)
        day_values(days{i}) = (interArrivalRatio(days{i})/interArrivalRatio('Wednesday')).*(one_day_temporal_new); 
    
    end

    %Concat day_values based on the order defined in the paper for a Week
    
    interArrivalTimes = horzcat(day_values('Thursday'),day_values('Friday'),day_values('Saturday'),day_values('Sunday'),day_values('Monday'),day_values('Tuesday'),day_values('Wednesday'));
    plot(interArrivalTimes);
   
    

    
end
