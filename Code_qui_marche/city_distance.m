function d = city_distance (indices_villes, coord_villes)

%Cette fonction permet de calculer la distance totale d'un chemin en
%fonction d'une liste de villes o� l'on souhaite passer et de leurs coordonn�es dans l'espace
d = 0;
[~,N] = size(indices_villes);
for j = 1:N-1
   %Lecture de la liste des indices pour stocker l'indice des villes (+1
   %car on peut commencer le indices � 0)
   indice_origine = indices_villes(j);
   indice_arrivee = indices_villes(j+1);
   %Calcul de la distance euclidienne entre deux indices cons�cutifs
   dist_inter_villes = sqrt((coord_villes(1,indice_arrivee)-coord_villes(1,indice_origine))^2 + (coord_villes(2,indice_arrivee)-coord_villes(2,indice_origine))^2);
   d = d + dist_inter_villes;
end

end