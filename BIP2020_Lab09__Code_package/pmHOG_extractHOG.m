function norm_HOG = pmHOG_extractHOG(I)

[sz1,sz2] = size(I);
h = sz1/8;
w = sz2/8;
norm_HOG = zeros(h-1,w-1,36);
for y = 1:h-1
    for x = 1:w-1
        y1 = 1+(y-1)*8;
        x1 = 1+(x-1)*8;
        block = I(y1:(y1+15),x1:(x1+15));
        block = imgaussfilt(block,0.1);
        feature_vector = [];
        for i = 1:2
            for j = 1:2
                i1 = 1+(i-1)*8;
                j1 = 1+(j-1)*8;
                [PHI,MAG] = pmHOG_gradient(block(i1:(i1+7),j1:(j1+7)));
                H = pmHOG_binner(PHI,MAG);
                feature_vector = [feature_vector,H];
            end
        end
        feature_vector = feature_vector/sum(feature_vector,'all');
        norm_HOG(y,x,:) = feature_vector;
    end
end
    
end
