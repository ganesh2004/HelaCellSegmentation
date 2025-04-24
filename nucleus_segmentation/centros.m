function [xc, yc] = centros(resNuc)
    statsN = regionprops(resNuc,'centroid');
    [tamxN, tamyN] = size(statsN);
    centroidN = statsN(tamxN).Centroid;
    xc = centroidN(1);
    yc = centroidN(2);
end