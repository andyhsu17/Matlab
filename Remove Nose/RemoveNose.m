





function rmnose = RemoveNose(desiredface,desirednose)
% Create a cascade detector object.
faceDetector = vision.CascadeObjectDetector();

% Read a video frame and run the detector.
 videoFileReader = vision.VideoFileReader(desiredface);
 videoFrame = step(videoFileReader);
 imshow(videoFrame);
 pause
%get box coordinates around face
bbox = step(faceDetector, videoFrame);

% Draw the returned bounding box around the detected face.
%videoOut = insertObjectAnnotation(videoFrame,'rectangle',bbox,'Face');
%figure, imshow(videoOut), title('Detected face');


%detect nose inside the face box and draw a new box around it, show the picture
 noseDetector = vision.CascadeObjectDetector('Nose', 'UseROI', true);
 noseBBox = step(noseDetector, videoFrame, bbox(1,:));
 
 videoOut = insertObjectAnnotation(videoFrame,'rectangle',noseBBox(2,:),'nose');
%figure, imshow(videoOut), title('Detected nose');
 

if any(noseBBox == 0)
    error('No nose detected')

else

% remove nose entirely
result = videoFrame;
result(noseBBox(2,2):(noseBBox(2,2) + noseBBox(2,4)), noseBBox(2,1):(noseBBox(2,1) + noseBBox(2,3)), 1) = 1;
result(noseBBox(2,2):(noseBBox(2,2) + noseBBox(2,4)), noseBBox(2,1):(noseBBox(2,1) + noseBBox(2,3)), 2) = 1;
result(noseBBox(2,2):(noseBBox(2,2) + noseBBox(2,4)), noseBBox(2,1):(noseBBox(2,1) + noseBBox(2,3)), 3) = 1;
imshow(result)
pause
 
%replace nose with another image
nose = imread(desirednose);
imshow(videoFrame)
hold on
x = [noseBBox(2,1), noseBBox(2,1) + noseBBox(2,3)];
y = [noseBBox(2,2), noseBBox(2,2) + noseBBox(2,4)];
result = image(x, y, nose); 

%rmnose = result;
end
%TRY 1
%result(noseBBox(2,2):(noseBBox(2,2) + 480), noseBBox(2,1):(noseBBox(2,1) + 160)) = pig;
% result(noseBBox(2,2):(noseBBox(2,2) + noseBBox(2,4)), noseBBox(2,1):(noseBBox(2,1) + noseBBox(2,3)), 2) = 1;
% result(noseBBox(2,2):(noseBBox(2,2) + noseBBox(2,4)), noseBBox(2,1):(noseBBox(2,1) + noseBBox(2,3)), 3) = 1;
% figure
%imshow(result);
% pig.XWorldLimits = videoFrame.XWorldLimits;
% pig.YWorldLimits = videoFrame.YWorldLimits;
% RA = imref2d(size(videoFrame));
% RB = imref2d(size(pig));
% pigface = imfuse(pig, videoFrame, 'blend', 'scaling', 'joint');
% [pigface,RD] = imfuse(videoFrame,RA,pig,RB);
% imshow(pigface);


% % Get the skin tone information by extracting the Hue from the video frame
% % converted to the HSV color space.
% [hueChannel,~,~] = rgb2hsv(videoFrame);
% 
% % Display the Hue Channel data and draw the bounding box around the face.
% figure, imshow(hueChannel), title('Hue channel data');
% rectangle('Position',bbox(1,:),'LineWidth',2,'EdgeColor',[1 1 0])
% 
% 
% % Detect the nose within the face region. The nose provides a more accurate
% % measure of the skin tone because it does not contain any background
% % pixels.
% noseDetector = vision.CascadeObjectDetector('Nose', 'UseROI', true);
% noseBBox     = step(noseDetector, videoFrame, bbox(1,:));
% 
% % Create a tracker object.
% tracker = vision.HistogramBasedTracker;
% 
% % Initialize the tracker histogram using the Hue channel pixels from the
% % nose.
% initializeObject(tracker, hueChannel, noseBBox(1,:));
% 
% % Create a video player object for displaying video frames.
% videoInfo    = info(videoFileReader);
% videoPlayer  = vision.VideoPlayer('Position',[300 300 videoInfo.VideoSize+30]);
% 
% % Track the face over successive video frames until the video is finished.
% while ~isDone(videoFileReader)
%     
%     % Extract the next video frame
%     videoFrame = step(videoFileReader);
%     
%     % RGB -> HSV
%     [hueChannel,~,~] = rgb2hsv(videoFrame);
%     
%     % Track using the Hue channel data
%     bbox = step(tracker, hueChannel);
%     
%     % Insert a bounding box around the object being tracked
%     videoOut = insertObjectAnnotation(videoFrame,'rectangle',bbox,'Face');    
%     
%     % Display the annotated video frame using the video player object
%     step(videoPlayer, videoOut);
%     
% end
% 
% % Release resources
% release(videoFileReader);
% release(videoPlayer);
end






% function RemoveNose
% nose = imread('nose.jpg');
% graynose = rgb2gray(nose);
% binarynose = imbinarize(graynose);
% % imshow(graynose);
% % title('My Nose');
% 
% face = imread('face.jpg');
% grayface = rgb2gray(face);
% binaryface = imbinarize(grayface);
% % imshow(grayface);
% % title('gray face')
% 
% 
% 
% nosepoints = detectSURFFeatures(binarynose);
% facepoints = detectSURFFeatures(grayface);
% 
% figure
% imshow(graynose);
% title('100 Strongest Feature Points from nose Image');
% hold on; 
% plot(selectStrongest(nosepoints, 50));
% 
% 
% figure
% imshow(grayface);
% title('100 Strongest Feature Points from face Image');
% hold on;
% plot(selectStrongest(facepoints, 100));
% 
% 
% end