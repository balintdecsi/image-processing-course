function [O] = image_segmenter(I, k)

[sz1,sz2,sz3] = size(I);
S = reshape(I,sz1*sz2,sz3);
[LUT,M] = mykmeans(S,k);
for i = 1:k
    S(LUT==i,:) = repmat(M(i,:),nnz(LUT==i),1);
end
O = reshape(S,sz1,sz2,sz3);
    
end
