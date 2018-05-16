%% Projet de metaheuristique - Recherche Tabou
%% Programeurs : Lisa Gramoli, Raphaël Chevasson, Aurélien Turpin
%% Experts techniques : ...


%% nettoyage

clc; clear all


%% Paramètres

% Nombre d'itérations durant lesquelles on s'interdit de repermuter deux
% villes :
taille_tabou = 10;

% Nombre d'itérations avant arret du programme :
nb_iteration = 3;


%% Initialisation

load('cities.mat');
%cities = [1 3 6 10; 2 5 8 3]
%cities = [0 1 2 3; 0 3 4 5]
nb_villes = size(cities, 2)

chemin = randperm(nb_villes)
%chemin = [1 1 3 2]
distance_chemin = total_distance(chemin, cities)

matrice_tabou = zeros(nb_villes);


%% Meilleur résultat

meilleur_chemin = chemin;
meilleure_distance = total_distance(chemin, cities);


%% itérations

for i = 1:nb_iteration
    fprintf('--- Iteration %i/%i ---', i, nb_iteration)
    % recherche du meilleur chemin voisin (i.e. construisible en une
    % permutation) et non tabou
    prochaine_permutation = permutation(matrice_tabou, cities, chemin)
    % actualisation du chemin
    chemin = chemin(permutation)
    distance_chemin = total_distance(chemin)

    % actualisation de la matrice tabou
    matrice_tabou = maj_matrice_tabou(matrice_tabou, permutation, taille_tabou)
    
    % stockage du meilleur chemin
    if distance_chemin < meilleure_distance
        meilleur_chemin = chemin
        distance_chemin = meilleure_distance
        disp('  meilleur chemin trouvé !')
    end
end