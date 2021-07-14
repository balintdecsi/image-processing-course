function M = step3_update(S, k, LUT, M)

for j = 1:k
    members = S(LUT==j,:);
    M(j,:) = mean(members);
end
    
end
