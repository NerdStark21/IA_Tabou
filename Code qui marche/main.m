%% Projet de metaheuristique - Recherche Tabou
%% Programeurs : Lisa Gramoli, Raphaël Chevasson, Aurélien Turpin
%% Experts techniques : ...


%% nettoyage

clc; clear all


%% Paramètres

% Nombre d'itérations durant lesquelles on s'interdit de repermuter deux
% villes :
taille_tabou = 5;

% Nombre d'itérations avant arret du programme :
nb_iteration = 20;


%% Initialisation

load('cities.mat');
%cities = generate_cities(100);
cities = ...
 [-6.4400212542671671 -1.4271601981054403 -3.6626197115742221 -2.0061618392897262 ...
  8.7636945696786626 -9.7118148512161433 -9.2905548801729978 -7.904169509722589 ...
  1.7480813523593284 4.8424502818772233;
  -3.423109843514216 -9.90426800580618 6.4200000066541563 -2.3991456316755215 ...
   8.8967270303777148 -8.768145288895564 8.895629225105818 1.7406874682312825 ...
  -3.341865349713653 1.9537220186720656];

nb_villes = size(cities, 2)

%chemin = randperm(nb_villes);
chemin = [1 2 3 4 5 6 7 8 9 10]
distance_chemin = total_distance(chemin, cities)

matrice_tabou = zeros(nb_villes);


%% Meilleur résultat

meilleur_chemin = chemin;
meilleure_distance = total_distance(chemin, cities);

list_distance_ = [];
list_iterations_ = zeros(1,nb_iteration);
%% itérations
k =1;
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
        meilleur_chemin = chemin
        meilleure_distance = distance_chemin
        disp('meilleur chemin trouvé !')
    end
    list_distance_(1,size(list_distance_,2)+1) = distance_chemin;
    list_iterations_(1,k)= k;
    k = k+1;
end

figure(1);
plot(list_iterations_,list_distance_);
xlabel('Nombre d''iterations');
ylabel('Distance')
title('Avec 10 villes, temps tabou = 5');