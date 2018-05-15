
%load('data.mat');

%coord_villes = [1 3 6 10; 2 5 8 3];
coord_villes = [0 1 2 3; 0 3 4 5];
chemin = [1 1 3 2];

d = city_distance(chemin,coord_villes)

d2 = total_distance(chemin, coord_villes)