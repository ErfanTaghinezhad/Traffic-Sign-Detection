function mask = createMask(imagePath)
    %read the image
    img = imread(imagePath);
    
    %fonvert image to HSV color space
    hsvImg = rgb2hsv(img);
    H = hsvImg(:,:,1);
    S = hsvImg(:,:,2);
    V = hsvImg(:,:,3);
    
    %for red color:
    H_min1 = 0.95;  H_max1 = 1.0;
    H_min2 = 0.0;   H_max2 = 0.05;
    S_min_red = 0.4; S_max_red = 1.0;
    V_min_red = 0.4; V_max_red = 1.0;
    
    %for blue color:
    H_min_blue = 0.55; H_max_blue = 0.70;
    S_min_blue = 0.4;  S_max_blue = 1.0;
    V_min_blue = 0.4;  V_max_blue = 1.0;
    
    %create mask for red color
    maskRed1 = (H >= H_min1) & (H <= H_max1);
    maskRed2 = (H >= H_min2) & (H <= H_max2);
    maskRedS = (S >= S_min_red) & (S <= S_max_red);
    maskRedV = (V >= V_min_red) & (V <= V_max_red);
    maskRed = (maskRed1 | maskRed2) & maskRedS & maskRedV;
    
    %create mask for blue color
    maskBlue = (H >= H_min_blue) & (H <= H_max_blue) & ...
               (S >= S_min_blue) & (S <= S_max_blue) & ...
               (V >= V_min_blue) & (V <= V_max_blue);
    
    %combine masks
    mask = maskRed | maskBlue;

    %save mask
    [~, name, ext] = fileparts(imagePath);
    maskPath = fullfile('masks', [name '_mask' ext]);
    imwrite(mask, maskPath);

    %display mask
    figure('Name', 'Mask');
    imshow(mask);
    title('Generated Mask');
end
