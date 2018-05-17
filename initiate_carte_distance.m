function carte_distance = initiate_carte_distance(coord_villes)

% Cette fonction renvoie la carte des distances des villes entre elles pour
% accélerer le calcul de la distance totale d'un chemin

nb_ville = size(coord_villes, 2);
carte_distance = zeros(nb_ville);

for k=1:nb_ville
    for j=1:k
        carte_distance(k, j) = city_distance([k, j], coord_villes);
    end
end


end