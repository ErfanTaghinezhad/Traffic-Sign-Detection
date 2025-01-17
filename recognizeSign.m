function label = recognizeSign(inputImagePath, featureMatPath)
    %load the featureMat
    load(featureMatPath, 'featureMat');
    
    %read the input image and  Creat Mask
    inputImageGray = createMask(inputImagePath);

    %extract features from the input image using SURF
    inputPoints = detectSURFFeatures(inputImageGray);
    [inputFeatures, inputPoints] = extractFeatures(inputImageGray, inputPoints);
    
    %visualize key points in input image
    figure; imshow(inputImageGray); hold on;
    plot(inputPoints.selectStrongest(50));
    title('Key Points in Input Image');
    
    %initialize variables to track the best match
    maxMatches = 4;
    bestLabel = '';
    
    %extract labels as a cell array from the featureMat
    labels = featureMat.Label;
    if istable(labels)
        labels = labels{:,1};
    end
    
    %loop through all the images in featureMat
    for i = 1:height(featureMat)
        %read the featureMat image
        refImage = imread(featureMat.ImageName{i});
        
        %check if the reference image is RGB or grayscale
        if size(refImage, 3) == 3
            refImageGray = rgb2gray(refImage);
        else
            refImageGray = refImage;
        end
        
        %extract features from the reference image using SURF
        refPoints = detectSURFFeatures(refImageGray);
        [refFeatures, ~] = extractFeatures(refImageGray, refPoints);
        
        %visualize key points in reference image
        %figure; imshow(refImageGray); hold on;
        %plot(refPoints.selectStrongest(50));
        %title(['Key Points in Reference Image ', num2str(i)]);
        
        %match features between the input image and the reference image
        matches = matchFeatures(inputFeatures, refFeatures, 'Unique', true, 'MaxRatio', 0.8);
        fprintf('Number of matches with image %d: %d\n', i, size(matches, 1));
        
        %check if this is the best match so far
        if size(matches, 1) > maxMatches
            maxMatches = size(matches, 1);
            bestLabel = labels{i};
        end
    end
    
    %return the label of the best match
    label = bestLabel;
    fprintf('The input sign is recognized as: %s\n', label);
end