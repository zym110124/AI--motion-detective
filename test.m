foregroundDetector = vision.ForegroundDetector('NumGaussians', 3, 'NumTrainingFrames', 50);
video = vision.VideoFileReader('movie.avi');
se = strel('square', 3);
blobAnalysis = vision.BlobAnalysis('BoundingBoxOutputPort', true, ...
    'AreaOutputPort', false, 'CentroidOutputPort', false, ...
    'MinimumBlobArea', 150);

while ~isDone(video)
    frame = step(video);
    foreground = step(foregroundDetector, frame);
    filteredForeground = imopen(foreground, se);       %Í¼Ïñ¿ªÔËËã
    box = step(blobAnalysis, filteredForeground);
    result = insertShape(frame, 'Rectangle', box, 'Color', 'green');
    imshow(result);
end