# Traffic Sign Detection and Recognition

This project aims to detect and recognize traffic signs from images using MATLAB. The system utilizes image processing techniques, specifically color masking and feature extraction, to identify different types of traffic signs such as Stop, Roundabout, Danger, Wrong Way, and No Entry.

## Overview

Traffic sign detection and recognition are critical tasks for autonomous driving and intelligent transportation systems. This project demonstrates how to use MATLAB for building an image-based traffic sign detection and recognition system. The system is capable of:
- Detecting traffic signs based on their color.
- Recognizing specific types of signs using feature matching algorithms.
- Visualizing the detection results with bounding boxes and labels for each recognized traffic sign.

## Key Features:
- **Color Masking**: Traffic signs are detected using color masks for red and blue colors in the HSV color space.
- **Sign Recognition**: Recognizes common traffic sign types (Stop, Roundabout, Danger, etc.) through SURF feature matching.
- **Visualization**: Bounding boxes and labels are drawn around detected signs for easy understanding.
- **MATLAB Implementation**: Entire project is developed in MATLAB, utilizing its Image Processing Toolbox.

## Components:
1. **createMask.m**: Generates binary masks to identify red and blue colors, helping in isolating traffic signs.
2. **processTrafficSign.m**: Detects the traffic sign, processes the image to crop relevant regions, and labels the detected sign.
3. **recognizeSign.m**: Recognizes the type of traffic sign by comparing the detected region with reference features stored in a `.mat` file.
4. **featureMat.mat**: Contains pre-extracted features and reference images used for sign recognition.
5. **Test Images**: A set of sample images (`Test1.jpg` to `Test5.jpg`) that demonstrate various types of traffic signs for testing the system.

## Requirements:
- **MATLAB** (R2018 or later)
- **Image Processing Toolbox**

## How to Run:
1. Clone the repository to your local machine.
2. Run the provided MATLAB scripts to detect and recognize traffic signs in test images.
3. Use the `recognizeSign` function to identify specific traffic signs.

## Future Improvements:
- Extend the project by adding more traffic sign types to the recognition system.
- Enhance the accuracy of detection and recognition, especially under challenging conditions like low light or occlusion.
- Implement real-time traffic sign recognition using video frames.

