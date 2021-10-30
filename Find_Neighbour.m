function neighbour = Find_Neighbour(x,y,input_image)
% p2 = input_image(x-1,y)
% p3 = input_image(x-1,y+1)
% p4 = input_image(x,y+1)
% p5 = input_image(x+1,y+1)
% p6 = input_image(x+1,y)
% p7 = input_image(x+1,y-1)
% p8 = input_image(x,y-1)
% p9 = input_image(x-1,y-1)

% p9, p2, p3
% p8, p1, p4
% p7, p6, p5

% (x-1,y-1), (x-1,y), (x-1,y+1)
% (x,y-1),   (x,y),   (x,y+1)
% (x+1,y-1), (x+1,y), (x+1,y+1)

if x>1 && x<size(input_image,1) && y>1 && y<size(input_image,2)

neighbour = [input_image(x-1,y),input_image(x-1,y+1),input_image(x,y+1),input_image(x+1,y+1),...
             input_image(x+1,y),input_image(x+1,y-1),input_image(x,y-1),input_image(x-1,y-1)];
else
    error('The pixel (x,y) is located at the edge of the image. No enough neighbours exist!');

end