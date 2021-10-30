function [output_image, MAT_image] = MAT_Thinning(input_image)

% output_image is the distance transform of the input image

output_image = input_image;
MAT_image = input_image;

input_image = (input_image == 255);
row = size(input_image, 1);
col = size(input_image, 2);

for x = 1:row
    for y = 1:col
        if input_image(x,y)==1            
            % Calculate the distance to the north boundary of the image
            if x == 1
                north_distance = 1;
            else
                for i = x-1:-1:1
                    if input_image(i,y) == 0
                        north_distance = x - i;
                        break;
                    elseif i == 1 && input_image(i,y) == 1
                        north_distance = x;
                    end
                end
            end           
            % Calculate the distance to the south boundary of the image
            if x == row
                south_distance = 1;
            else
                for i = x+1:1:row
                    if input_image(i,y)==0
                        south_distance = i-x;
                        break;
                    elseif i==row && input_image(i,y)==1
                        south_distance = row-x;
                    end
                end
            end            
            % Calculate the distance to the west boundary of the image
            if y == 1
                west_distance = 1;
            else
                for i = y-1:-1:1
                    if input_image(x,i) == 0
                        west_distance = y - i;
                        break;
                    elseif i == 1 && input_image(x,i) == 1
                        west_distance = y;
                    end
                end
            end
            % Calculate the distance to the east boundary of the image
            if y == col
                east_distance = 1;
            else
                for i = y+1:1:col
                    if input_image(x,i) == 0
                        east_distance = i - y;
                        break;
                    elseif i == col && input_image(x,i) == 1
                        east_distance = col - y;
                    end
                end
            end
            DV = [north_distance, south_distance, west_distance, east_distance];
            min_distance = min(DV);
            output_image(x,y) = min_distance;            
            if sum(DV == min_distance)>1 % Media Axis
                MAT_image(x,y) = min_distance;
            else
                MAT_image(x,y) = 0;
            end            
        end
    end
end


end