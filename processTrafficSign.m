function processTrafficSign(inputImagePath, featureMatPath)
    %load the input image
    inputImage = imread(inputImagePath);

    %display the original image
    figure;
    imshow(inputImage);
    title('Original Image');

    %step1: Apply the creatMask function
    mask = createMask(inputImagePath);

    %display the mask
    figure;
    imshow(mask);
    title('Mask (Binary Image)');

    %step2: perform edge detction on the mask
    edges = edge(mask, 'Canny');
    figure;
    imshow(edges);
    title('Edges Detected');

    %step3:find contours and bounding box for the trafic sign
    stats = regionprops(edges, 'BoundingBox', 'Area');

    %filter based on area to avoid small noiss
    minArea = 500;
    filteredStats = stats([stats.Area] > minArea);

    if isempty(filteredStats)
        error('No traffic sign detected!');
    end

    %assuming the largest detected area is the trafic sign
    [~, largestIdx] = max([filteredStats.Area]);
    boundingBox = filteredStats(largestIdx).BoundingBox;

    %crop the trafic sign based on bounding box
    croppedSign = imcrop(inputImage, boundingBox);

    %display the cropped trafic sign
    figure;
    imshow(croppedSign);
    title('Detected Traffic Sign');

    %step4:recognize the type of trafic sign
    tempFilePath = 'temp_cropped_sign.jpg';
    imwrite(croppedSign, tempFilePath); 

    %call recognizSign with the path to the cropped sign
    label = recognizeSign(tempFilePath, featureMatPath);
    fprintf('Recognized Traffic Sign: %s\n', label);

    %delete the temporary file
    delete(tempFilePath);

    %step 5: Display the original image with bounding box and label
    figure;
    imshow(inputImage);
    hold on;
    rectangle('Position', boundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
    text(boundingBox(1), boundingBox(2) - 10, label, 'Color', 'red', ...
        'FontSize', 14, 'FontWeight', 'bold', 'BackgroundColor', 'white');
    hold off;
    title('Traffic Sign Detection and Recognition');
end