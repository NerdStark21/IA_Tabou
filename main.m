%% Projet de metaheuristique - Recherche Tabou
%% Programeurs : Lisa Gramoli, Raphaël Chevasson, Aurélien Turpin
%% Experts techniques : ...


%% nettoyage

clc; clear all;
dist_eucl([1, 1], [2, 2])

%% Paramètres

% Nombre d'itérations durant lesquelles on s'interdit de repermuter deux
% villes :
taille_tabou = 100;

% Nombre d'itérations avant arret du programme :
nb_iteration = 100;

%% Initialisation
clc;
load('cities.mat');
cities = generate_cities(300);
nb_villes = size(cities, 2)

chemin = randperm(nb_villes);
mat_dist = initiate_carte_distance(cities);
distance_chemin = total_distance(chemin, mat_dist)

matrice_tabou = zeros(nb_villes);

%% Meilleur résultat

meilleur_chemin = chemin;
meilleure_distance = total_distance(chemin, mat_dist);


%% itérations
k=1;
for nb_cities= 50:50:200
    nb_cities
    cities = generate_cities(nb_cities);
    nb_villes = size(cities, 2);
    
    chemin = randperm(nb_villes);
    mat_dist = initiate_carte_distance(cities);
    distance_chemin = total_distance(chemin, mat_dist);
    
    matrice_tabou = zeros(nb_villes);
    for i = 1:nb_iteration
        %fprintf('--- Iteration %i/%i ---', i, nb_iteration)
        % recherche du meilleur chemin voisin (i.e. construisible en une
        % permutation) et non tabou
        [prochaine_permutation, distance_chemin, ~] ...
            = permutation(chemin, matrice_tabou, mat_dist);
        
        i = prochaine_permutation(1);
        j = prochaine_permutation(2);
        indice_i = find(chemin==i);
        indice_j = find(chemin==j);
        
        % actualisation du chemin
        chemin([indice_i indice_j]) = chemin([indice_j indice_i]);
        distance_chemin = total_distance(chemin, mat_dist);
        
        % actualisation de la matrice tabou
        matrice_tabou = maj_matrice_tabou(matrice_tabou,...
            prochaine_permutation, taille_tabou);
        
        
        
        % stockage du meilleur chemin
        if distance_chemin < meilleure_distance
            meilleur_chemin = chemin;
            meilleure_distance = distance_chemin;
            %disp('  meilleur chemin trouvé !');
        end
    end
    list_dist(k) = meilleure_distance;
    k=k+1;
end
%%
figure(1)
size(list_dist)
size((10:10:200))
plot(50:50:200, list_dist)
xlabel('Nombre de ville')
ylabel('Distance du meilleur chemin')
grid()
title('Itération = 100, Taille de la liste tabou = 100');