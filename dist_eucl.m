function dist = dist_eucl(coord_1, coord_2)
if coord_2 == 0
    dist = sqrt(sum(coord_1.^2));
else
    dist = sqrt(sum((coord_1-coord_2).^2));
end
end