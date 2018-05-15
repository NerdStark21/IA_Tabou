function next_ville = glouton(list_ville, list_tabou, ville_actuelle)
% Input :
% listVille => la liste totale des coord des villes
% listTabou => la liste des indices des villes tabou
% Output :
% next_ville => ville suivante dans laquelle aller

list_ville(list_tabou) = [];

dist = zeros(size(list_ville, 2));
for k=1:size(list_ville, 2)
    dist(k) = distance([ville_actuelle k]);
end
% On supprime la distance 0 parce que ça represente la distance entre la
% ville actuelle et elle-même
dist(dist(:) == 0) = [];

[~, next_ville] = min(dist);

end