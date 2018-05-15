function d = total_distance (indices_villes, coord_villes)
%Calcule la distance totale pour le point 0
[~,N] = size(indices_villes);
indice_premiere_ville = indices_villes(1);
indice_derniere_ville = indices_villes(N);
dist_debut = sqrt(coord_villes(1,indice_premiere_ville)^2 + coord_villes(2,indice_premiere_ville)^2);
dist_intermediaire = city_distance(indices_villes, coord_villes);
dist_fin = sqrt(0-(coord_villes(1,indice_derniere_ville))^2 + (0-coord_villes(2,indice_derniere_ville))^2);

d = dist_debut + dist_intermediaire + dist_fin;
end