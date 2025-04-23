function [nucleus] = nucseg(I, cell)
cell = imresize(cell, [500, 500]);
I = imresize(I, [500, 500]);
[u, v] = size(cell);
Ig = imgaussfilt(I,.2);
J = stdfilt(Ig);
edges = edge(J, 'canny');




se = strel('diamond', 2);
edges = imdilate(edges, se);



newShape = zeros(u,v);
for i=1:u
    for j=1:v
        if edges(i,j) == 255 || edges(i,j) == 1
            newShape(i,j) = 0;
        else 
            newShape(i,j) = 255;
        end
    end
end


bw = bwareaopen(newShape,300);
Res = imfill(bw,'holes');

CC = bwconncomp(Res, 4);
numPixels = cellfun(@numel, CC.PixelIdxList);
[tamx,tamy] = size(numPixels);

nucleus = zeros(u,v);
for k=1:tamy
    if numPixels(k) >= 400 && numPixels(k) < 40000
        nucleus(CC.PixelIdxList{k}) = 255;
    end
end
propNuc = nucleus;







CC_nuc = bwconncomp(nucleus);
numNucs = cellfun(@numel, CC_nuc.PixelIdxList);
[x_n,y_n] = size(numNucs);


realNucs = zeros(u,v);

x_img = u/2;
y_img = v/2;



    for n=1:y_n
        nuc = zeros(u,v);
        nuc(CC_nuc.PixelIdxList{n}) = 255;
        [xN, yN] = centros(nuc);
            [xC, yC] = centros(cell);
            dC = sqrt((xC - x_img)*(xC - x_img) + (yC - y_img)*(yC - y_img));           
            if dC < 40
                d = sqrt((xC - xN)*(xC - xN) + (yC - yN)*(yC - yN));
                if d < 110 %60
                    realNucs(CC_nuc.PixelIdxList{n}) = 255;  
                end
            end
        
    end  


nucleus = realNucs;



nucleus = dv_checkNucinCell(cell, nucleus);
nucleus = dv_checkRound(nucleus);


nucMay = nucleus;
nucleus = zeros(u,v);
CC_nuc = bwconncomp(nucMay);
numNucs = cellfun(@numel, CC_nuc.PixelIdxList);
[x_n,y_n] = size(numNucs);
if y_n ~= 0
    valMax = max(max(numNucs));
    nucleus(CC_nuc.PixelIdxList{find(valMax)}) = 255;
end

nucleus = dv_closeNucleis(I, nucleus, cell);

end