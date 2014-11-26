%Just takes in Image Path
function y = imageToPlot(image)

%Convert to Greyscale
image = rgb2gray(image);

y = [];
%look for first black pixel from the top
for i=1:size(image,2)
    for j=1:size(image,1)
        %collect y coordinates in variable y
        
        if image(j,i) == 0
            y(end + 1) = (size(image,1) - j);
            break;
        end
        
    end
end

end