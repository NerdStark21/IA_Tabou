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
nb_iteration = 100;


%% Initialisation

load('cities.mat');
cities = generate_cities(100);
nb_villes = size(cities, 2)

chemin = randperm(nb_villes);
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
    [prochaine_permutation, distance_chemin, ~] ...
        = permutation(matrice_tabou, cities, chemin);

    i = prochaine_permutation(1);
    j = prochaine_permutation(2);
    indice_i = find(chemin==i);
    indice_j = find(chemin==j);
    
    % actualisation du chemin
    chemin([indice_i indice_j]) = chemin([indice_j indice_i]);
    distance_chemin = total_distance(chemin, cities);

    % actualisation de la matrice tabou
    matrice_tabou = maj_matrice_tabou(matrice_tabou,...
        prochaine_permutation, taille_tabou);
    
    % stockage du meilleur chemin
    if distance_chemin < meilleure_distance
        meilleur_chemin = chemin;
        meilleure_distance = distance_chemin
        disp('  meilleur chemin trouvé !')
    end
end