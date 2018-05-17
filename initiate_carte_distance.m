function carte_distance = initiate_carte_distance(coord_villes)

% Cette fonction renvoie la carte des distances des villes entre elles pour
% accélerer le calcul de la distance totale d'un chemin
% Sachant que sur la diagonale sont stockée les distances des villes à (0,
% 0)

nb_ville = size(coord_villes, 2);
carte_distance = zeros(nb_ville);

for k=1:nb_ville
    for j=1:k
        % Sur la diagonale, on va stocker les distance des villes à (0, 0)
        if j ==k
            carte_distance(k, j) = dist_eucl(coord_villes(k), 0);
        else
            carte_distance(k, j) = dist_eucl(coord_villes(k), coord_villes(j));
        end
    end
end
end

function dist = dist_eucl(coord_1, coord_2)
if coord_2 == 0
    dist = sqrt(sum(coord_1.^2));
else
    dist = sqrt(sum(coord_1-coord_2).^2);
end
end