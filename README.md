# Traffic Sign Detection and Recognition

This project demonstrates how to detect and recognize traffic signs from images using MATLAB. By leveraging image processing techniques, such as color masking, feature extraction, and SURF-based matching, the system identifies traffic signs like Stop, Roundabout, Danger, Wrong Way, and No Entry. The code includes functionality for detection, recognition, and visualization.

## Overview

Traffic sign detection and recognition are crucial tasks in autonomous driving and intelligent transportation systems. This project uses MATLAB to build a robust system that:
- Detects traffic signs using color-based masking techniques.
- Recognizes sign types through feature-matching algorithms.
- Highlights detected signs with bounding boxes and labels.

## Key Features

1. **Color Masking**:
   - Traffic signs are detected using red and blue color masks in the HSV color space.
   - Supports various lighting conditions by defining intensity and saturation thresholds.

2. **Sign Recognition**:
   - Recognizes common traffic signs (Stop, Roundabout, Danger, etc.) using SURF feature detection and matching against a database of reference images.

3. **Visualization**:
   - Displays original images, masks, edges, and detected signs with bounding boxes and labels for clarity.

4. **MATLAB Implementation**:
   - Developed entirely in MATLAB, utilizing its Image Processing Toolbox for efficient computation and visualization.

## Components

1. **`createMask.m`**:
   - Generates binary masks to isolate red and blue colors in the HSV color space. 
   - Combines masks to detect traffic sign regions.
   - Saves masks and displays them for verification.

2. **`processTrafficSign.m`**:
   - Handles the entire pipeline from detection to recognition.
   - Applies color masks, detects edges, filters regions, and identifies the bounding box of the sign.
   - Crops and passes the detected region to the recognition step.
   - Displays results, including bounding boxes and labels, over the original image.

3. **`recognizeSign.m`**:
   - Matches detected signs with reference features stored in a `.mat` file (`featureMat.mat`).
   - Extracts features using SURF and matches them with pre-extracted features of reference images.
   - Outputs the recognized sign's label.

4. **`featureMat.mat`**:
   - Contains a database of pre-extracted features and labels for various traffic signs.
   - Ensures efficient and accurate recognition by comparing with the input image.

5. **Test Images**:
   - A set of example images (`Test1.jpg` to `Test5.jpg`) is included to demonstrate the system's functionality with different traffic signs.

## Usage Instructions

1. **Setup**:
   - Place all the `.m` files, the `featureMat.mat`, and test images in the same directory.

2. **Run**:
   - Use `processTrafficSign.m` as the entry point.
   - Example: 
     ```matlab
     processTrafficSign('Test1.jpg', 'featureMat.mat');
     ```
   - Replace `'Test1.jpg'` with any test image of your choice.

3. **Output**:
   - The system will display the following:
     - Original image
     - Generated color mask
     - Detected edges
     - Cropped traffic sign
     - Recognized label displayed on the original image

## Future Enhancements

- Extend support for additional sign types and colors.
- Incorporate machine learning techniques for improved accuracy.
- Develop real-time video processing capability for live traffic scenarios.

## File Structure
- **`createMask.m`**: Color-based detection mask generator.
- **`processTrafficSign.m`**: Main pipeline for traffic sign detection and recognition.
- **`recognizeSign.m`**: Recognition engine using SURF feature matching.
- **`featureMat.mat`**: Database of pre-extracted features and labels.
- **Test Images**: Sample traffic sign images for demonstration purposes.

Feel free to improve and adapt this project for your specific needs!
