function [permu,mini,liste_delta] = permutation(mat_tabou,coord_villes, chemin)
%Cette fonction permet de faire des permutations pour voir celle qui offre
%un chemin qui minimise le coût.

d = total_distance(chemin,coord_villes);
chemin_origine = chemin;
% On échange
indice1 = find(chemin==1);
indice2 = find(chemin==2);
chemin(indice1) = 2;
chemin(indice2) = 1;
%Calcul de la distance avec le chemin permuté
d2 = total_distance(chemin,coord_villes);

min_delta = d2 + 1;
[mt,nt] = size(mat_tabou);
liste_optimum = [];
liste_delta = [];

for i = 1:mt
    for j = 1:nt
        chemin = chemin_origine;
        if(mat_tabou(i,j) == 0)
            %Permutation
            if(i~=j)
                indiceI = find(chemin==i);
                indiceJ = find(chemin==j);
                chemin(indiceI) = j;
                chemin(indiceJ) = i;
                %Calcul de la distance avec le chemin permuté
                d2 = total_distance(chemin,coord_villes);
                %Calcul de la différence de distance pour le coût
                delta = d2 - d;
                liste_delta(i,j) = delta;
                if(delta < min_delta)
                    liste_optimum = [i j];
                    min_delta = delta;
                elseif (delta == min_delta)
                    liste_optimum(size(liste_optimum, 1)+1,:) = [i j];
                end
            end
        end
    end
    
    [m,n] = size(liste_optimum);
    rn = ceil(rand()*m);
    permu = liste_optimum(rn,:);
    mini = min_delta;
end