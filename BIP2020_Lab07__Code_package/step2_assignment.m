function LUT = step2_assignment(S, k, LUT, M)

[m,n] = size(S);
for i = 1:m
    for j = 1:k
        dist(j) = sum((abs(S(i,:) - M(j,:))).^2);
    end
    [minimum,idx] = min(dist);
    LUT(i) = idx;
end
    
end
