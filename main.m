
% Nombre de ville que l'on va stocher dans la liste tabou
taille_tabou = 10;
list_tabou = zeros(1, taille_tabou);

load('cities.mat');

%coord_villes = [1 3 6 10; 2 5 8 3];
coord_villes = [0 1 2 3; 0 3 4 5];
chemin = [1 1 3 2];

nb_iteration = 10;
chemin = randperm(size(cities, 2));

while nb_iteration >= 1
    
    sprintf('reste %i iteration', nb_iteration)
    nb_iteration = nb_iteration -1;
end