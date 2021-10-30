function threhold_level = Otsu_Threhold(histogram, Level_Bits)

% Calculate the maximum of the gray level of the image
Max_gray_level = 2^Level_Bits-1;

% Calculate the mean of the gray levels of total pixels in the image
Mean_total = dot(0:Max_gray_level,histogram);

% w1 is the probability that a pixel is in the area of Object 1
% w1 = h(1)+h(2)+...+h(i),i denotes the threhold level
w1 = 0;

% w2 is the probability that a pixel is in the area of Object 2
w2 = 1-w1;

% Mean1 is the mean of the gray level of Object 1
mean1 = 0;

% Mean2 is the mean of the gray level of Object 2
mean2 = 0;

% Sum1 is the intermediate variable to compute Mean1
% Mean1 = Sum1/w1
Sum1 = 0;

% theta_B is the variance between Group 1 and Group 2
theta_B = 0;

% Max_theta_B is the maximum value of theta_B
Max_theta_B = 0;

threhold_level = 0;

% i denotes the current threhold level
for i = 0:Max_gray_level
    w1 = w1+histogram(i+1);
    w2 = 1-w1;
    Sum1 = Sum1 + i*histogram(i+1);
    if w1 ==0 || w2 ==0
        theta_B = 0; % theta_B = w1*w2*(mean1-mean2)^2
    else
        mean1 = Sum1/w1;
        mean2 = (Mean_total-Sum1)/w2;
        theta_B = w1*w2*(mean1-mean2)^2;
    end
    
    if theta_B > Max_theta_B
        Max_theta_B = theta_B;
        threhold_level = i;
    end       
    
end

end