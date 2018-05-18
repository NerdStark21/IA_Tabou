%% Projet de metaheuristique - Recherche Tabou
%% Programeurs : Lisa Gramoli, Rapha�l Chevasson, Aur�lien Turpin
%% Experts techniques : ...

%   Columns 1 through 23
%
%     20     3    27    18    23    21     2     5    28     8    19     4    24     7     6    12    17    13     9    16    15    22    30
%
%   Columns 24 through 30
%
%     14    26     1    11    10    29    25
%% nettoyage

clc; clear all;

%% Param�tres

% Nombre d'it�rations durant lesquelles on s'interdit de repermuter deux
% villes :
taille_tabou = 15;

% Nombre d'it�rations avant arret du programme :
nb_iteration = 750;

%% Initialisation
clc;
load('cities.mat');
%rand('state',390);
rand('state',256);
%cities = round(rand(2,30)*20-10)
cities = round(rand(2,50)*20-10);
rand('state', sum(100*clock));
%%
%cities = generate_cities(100);
nb_villes = size(cities, 2)

chemin = [1:nb_villes]
%%
%chemin = randperm(nb_villes);
%chemin = [1 2 3 4 5 6 7 8 9 10]

%chemin = randperm(nb_villes);
mat_dist = initiate_carte_distance(cities);
distance_chemin = total_distance(chemin, mat_dist)

matrice_tabou = zeros(nb_villes);

%% Meilleur r�sultat

meilleur_chemin = chemin;
meilleure_distance = total_distance(chemin, mat_dist);


%% it�rations
% k=1;
% for nb_cities= 50:50:200
%     nb_cities
%     cities = generate_cities(nb_cities);
%     nb_villes = size(cities, 2);
%
%     chemin = randperm(nb_villes);
%     mat_dist = initiate_carte_distance(cities);
%     distance_chemin = total_distance(chemin, mat_dist);
%
%     matrice_tabou = zeros(nb_villes);
k=1;
for taille_tabou =30:30
    
    chemin = randperm(nb_villes);
    distance_chemin = total_distance(chemin, mat_dist)
    meilleur_chemin = chemin;
    meilleure_distance = total_distance(chemin, mat_dist);
    matrice_tabou = zeros(nb_villes);
    for i = 1:nb_iteration
%         fprintf('--- Iteration %i/%i ---', i, nb_iteration)
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
%             disp('  meilleur chemin trouv� !');
        end
    end
    taille_tabou
    list(k) = meilleure_distance;
    k=k+1;
end
%%
figure(1)
plot((30:30), list)
grid()
%     list_dist(k) = meilleure_distance;
%     k=k+1;
% end
%%
% figure(1)
% size(list_dist)
% size((10:10:200))
% plot(50:50:200, list_dist)
% xlabel('Nombre de ville')
% ylabel('Distance du meilleur chemin')
% grid()
% title('It�ration = 100, Taille de la liste tabou = 100');