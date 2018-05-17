function dist = total_distance(chemin, mat_dist)
% Calcule la distance totale d'un chemin
dist = mat_dist(chemin(1), chemin(1));
for k=1:size(chemin, 2)-1
    %a = chemin(k);
    %b = chemin(k+1);
    if chemin(k) > chemin(k+1)
        dist = dist + mat_dist(chemin(k), chemin(k+1));
    else
        dist = dist + mat_dist(chemin(k+1), chemin(k));
    end
end
dist = dist + mat_dist(chemin(size(chemin, 2)), chemin(size(chemin, 2)));
end