function [H, level_bits] = CalculateHistogram(image)

% Determine the bits of gray-level quantization
Max_level = max(max(image));
max_level = double(Max_level);% the input of log2() cannot be uint 8
level_bits = ceil(log2(max_level+1));

% Determine the size of the image
N = size(image,1)*size(image,2);
H = zeros(2^level_bits,1);

% Calculate the histogram for each gray level
for i = 0:1:2^level_bits-1
    H(i+1) = sum(sum(image==i))/N;
end

% Plot the histogram of the image
figure;
x = 0:2^level_bits-1;
bar(x,H);
xlabel('Gray Level');
ylabel('Histogram');
end