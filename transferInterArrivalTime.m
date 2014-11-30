function interArrivalTime(filename)
    path_location = 'C:/Users/Koustubh/Dropbox/Keio/Research/Video on cloud/general related papers/Gathering Data/';
    
    fmt = 'png';

    image = imread(strcat(path_location,filename),fmt);
    transfer_one_day_temporal = (imageToPlot(image));

    plot(transfer_one_day_temporal/1.066);

end
