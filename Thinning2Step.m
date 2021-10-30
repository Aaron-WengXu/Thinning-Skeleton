function output_image = Thinning2Step(input_image)
% output_image = input_image;
input_image = (input_image == 255);
step1 = {[-1,1]};
step2 = {[-1,1]};

while ~isempty(step1) || ~isempty(step2)
    % Step 1
    step1 = {};
    for x = 2:size(input_image,1)-1
        for y = 2:size(input_image,2)-1
            neighbour = Find_Neighbour(x,y,input_image);
            if size(neighbour)~=8
                error("The number of neighbours of the current pixel is not 8!");
            end
            p2 = neighbour(1);
            p3 = neighbour(2);
            p4 = neighbour(3);
            p5 = neighbour(4);
            p6 = neighbour(5);
            p7 = neighbour(6);
            p8 = neighbour(7);
            p9 = neighbour(8);
            
            if (input_image(x,y) == 1 && ...%the pixel belongs to object
                    sum(neighbour) > 1 && ...
                    sum(neighbour) < 7 && ...
                    Transitions01(neighbour) == 1 && ...
                    p2*p4*p6 == 0 && ...
                    p4*p6*p8 == 0)
                
                step1(end+1) = {[x,y]};
            end
        end
    end
    if(~isempty(step1))
        for i =1 :length(step1)
            index = cell2mat(step1(i));
            input_image(index(1),index(2)) = 0;
        end
    end
    
    % Step 2
    step2 = {};
    for x = 2:size(input_image,1)-1
        for y = 2:size(input_image,2)-1
            neighbour = Find_Neighbour(x,y,input_image);
            if size(neighbour)~=8
                error("The number of neighbours of the current pixel is not 8!");
            end
            p2 = neighbour(1);
            p3 = neighbour(2);
            p4 = neighbour(3);
            p5 = neighbour(4);
            p6 = neighbour(5);
            p7 = neighbour(6);
            p8 = neighbour(7);
            p9 = neighbour(8);
            
            if (input_image(x,y) == 1 && ...%the pixel belongs to object
                    sum(neighbour) > 1 && ...
                    sum(neighbour) < 7 && ...
                    Transitions01(neighbour) == 1 && ...
                    p2*p4*p8 == 0 && ...
                    p2*p6*p8 == 0)
                
                step2(end+1) = {[x,y]};
            end
        end
    end
    if(~isempty(step2))
        for i =1 :length(step2)
            index = cell2mat(step2(i));
            input_image(index(1), index(2)) = 0;
        end
    end
end
output_image = input_image;
end









