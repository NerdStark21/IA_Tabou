function carte_distance = initiate_carte_distance(list_coord_ville, coord_villes)

% Cette fonction renvoie la carte des distances des villes entre elles pour
% accélerer le calcul de la distance totale d'un chemin

nb_ville = size(list_coord_ville, 2);
carte_distance = zeros(nb_ville);

for k=1:nb_ville
    for j=1:nb_ville
        carte_distance(k, j) = city_distance(
    end
end


end