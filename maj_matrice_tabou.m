function matrice_tabou = maj_matrice_tabou(matrice_tabou, permutation,...
                                           taille_tabou)
% fonction qui met � jour la matrice tabou (contenant les permutations
% interdites) entre deux it�rations.
% matrice_tabou : matrice_tabou(i,j) est le nbre d'it�ration durant
%     laquelle la permutation [i, j] ne peut pas �tre effectu�e.
% permutation : [i, j] les indices des villes permut�es lors de la derni�re
%     it�ration

%% d�croissance du nombre d'it�rations restant pour les autres permutations
matrice_tabou(matrice_tabou > 0) = matrice_tabou(matrice_tabou > 0) - 1;

%% mise en m�moire de la permutation taboue pendant taille_tabou it�rations
i = permutation(1)
j = permutation(2)
% on part du principe que i ~= j (car c'est une permutation)
matrice_tabou(i, j) = taille_tabou;
matrice_tabou(j, i) = taille_tabou;

end