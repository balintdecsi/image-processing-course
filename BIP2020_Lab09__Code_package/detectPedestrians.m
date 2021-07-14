function [score] = detectPedestrians(I, sample_HOG)

my_HOG = pmHOG_extractHOG(I);
HOG = my_HOG .* sample_HOG;
HOG(HOG<=.01) = 0;
score = sum(HOG,'all','omitnan');
    
end
