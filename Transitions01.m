function number = Transitions01(neighbour)
% neighbour is an array of length 8
% p2, p3, p4, p5, p6, p7, p8, p9
if size(neighbour)~=8
    error("The length of the neighbours of the current boundary pixel is not 8!");
end

% convert the pixel values of neighbour to string
% p2, p3, p4, p5, p6, p7, p8, p9, p2
% find the pattern '01' in the string
k = strfind(num2str([neighbour,neighbour(1)]),'0  1');
number = length(k);

end