function [permu,mini,liste_delta] = permutation(chemin, mat_tabou, mat_dist)
%Cette fonction permet de faire des permutations pour voir celle qui offre
%un chemin qui minimise le coût.

% d la distance totale actuelle
d = total_distance(chemin, mat_dist);
% on stocke le chemin d'origine
chemin_origine = chemin;
% On fait un échange pour initialiser d2
indice1 = find(chemin==1);
indice2 = find(chemin==2);
chemin(indice1) = 2;
chemin(indice2) = 1;
%Calcul de la distance avec le chemin permuté
min_delta = total_distance(chemin, mat_dist) + 1;

for i = 1:size(mat_tabou, 2)
    for j = 1:i
        chemin = chemin_origine;
        if(mat_tabou(i,j) == 0)
            %Permutation
            if(i~=j)
                indiceI = find(chemin==i);
                indiceJ = find(chemin==j);
                chemin(indiceI) = j;
                chemin(indiceJ) = i;
                %Calcul de la distance avec le chemin permuté
                %d2 = total_distance(chemin,coord_villes);
                d2 = total_distance(chemin, mat_dist);
                %Calcul de la différence de distance pour le coût
                delta = d2 - d;
                liste_delta(i,j) = delta;
                if(delta < min_delta)
                    liste_optimum = [i j];
                    min_delta = delta;
                    d_min = d2;
                elseif (delta == min_delta)
                    liste_optimum(size(liste_optimum, 1)+1,:) = [i j];
                end
            end
        end
    end
end
rn = ceil(rand()*size(liste_optimum, 1));
permu = liste_optimum(rn,:);
mini = d_min;
end