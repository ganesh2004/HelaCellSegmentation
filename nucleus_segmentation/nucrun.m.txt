celldirectory = 'predicted_masks-20250421T103208Z-001\predicted_masks\';
originaldirectory = 'ROI_1656-6756-329\';
read_imgO = dir([celldirectory, '*.png']);
tic
for k=1:300
    fprintf('%i\n', k);
    files = read_imgO(k).name;
    I = imread(strcat(originaldirectory,files));
    cell = imread(strcat(celldirectory, files));
    [nucleus] = nucseg(I, cell);
    imwrite(nucleus, strcat('nucleus segmentation\',files, '.png'));
end