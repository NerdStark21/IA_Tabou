function d = total_distance (indices_villes, coord_villes)
%Calcule la distance totale pour le point 0
[~,N] = size(indices_villes);
indice_premiere_ville = indices_villes(1);
indice_derniere_ville = indices_villes(N);
dist_debut = sqrt(coord_villes(1,indice_premiere_ville)^2 + coord_villes(2,indice_premiere_ville)^2);

%dist_intermediaire = city_distance(indices_villes, coord_villes);
dist_intermediaire = 0;
[~,N] = size(indices_villes);
for j = 1:N-1
   %Lecture de la liste des indices pour stocker l'indice des villes (+1
   %car on peut commencer le indices à 0)
   indice_origine = indices_villes(j);
   indice_arrivee = indices_villes(j+1);
   %Calcul de la distance euclidienne entre deux indices consécutifs
   dist_inter_villes = sqrt((coord_villes(1,indice_arrivee)-coord_villes(1,indice_origine))^2 + (coord_villes(2,indice_arrivee)-coord_villes(2,indice_origine))^2);
   dist_intermediaire = dist_intermediaire + dist_inter_villes;
end

dist_fin = sqrt((0-coord_villes(1,indice_derniere_ville))^2 + (0-coord_villes(2,indice_derniere_ville))^2);

d = dist_debut + dist_intermediaire + dist_fin;
end