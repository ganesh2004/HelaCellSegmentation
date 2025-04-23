pathOriginales = 'ROI_1656-6756-329\';
pathSave = 'BW\'
path
read_imgO = dir([pathOriginales, '*.png']);
clc
tic
%fprintf('%s\n', read_imgO(1).name)
for k=1:300
    fprintf('%d\n',k)
    files = strcat(string(k) , '.png');
    IO = imread(strcat(pathOriginales,files));

    IO = I;

    I = imresize(I, [500 500]);
    
    [u,v] = size(I);
    
    
    
    
    

    IO = imgaussfilt(IO,2);
    BW = im2bw(IO, graythresh(IO));
    BW = one2zero(BW);
    BW = bwareaopen(BW,3000);
    imwrite(BW, strcat(pathSave,files));
end