function matrice_tabou = maj_matrice_tabou(matrice_tabou, permutation,...
                                           taille_tabou)
% fonction qui met à jour la matrice tabou (contenant les permutations
% interdites) entre deux itérations.
% matrice_tabou : matrice_tabou(i,j) est le nbre d'itération durant
%     laquelle la permutation [i, j] ne peut pas être effectuée.
% permutation : [i, j] les indices des villes permutées lors de la dernière
%     itération

%% décroissance du nombre d'itérations restant pour les autres permutations
matrice_tabou(matrice_tabou > 0) = matrice_tabou(matrice_tabou > 0) - 1;

%% mise en mémoire de la permutation taboue pendant taille_tabou itérations
i = permutation(1)
j = permutation(2)
% on part du principe que i ~= j (car c'est une permutation)
matrice_tabou(i, j) = taille_tabou;
matrice_tabou(j, i) = taille_tabou;

end