function ClassMap = recognition_phase(I, MODEL)

N = 1/225 * ones(15);
[sz1,sz2] = size(I);

%% creating BB array
BB = zeros(sz1,sz2,9);
for k=1:9
    h = laws_kernel(k);
    B = conv2(I,h,'same');
    BB(:,:,k) = conv2(B.^2,N,'same');
end
%% Filling ClassMap up
no_class = size(MODEL,1);
ClassMap = zeros(sz1,sz2);
sum_abs_diff = zeros(1,no_class);
for i = 1:sz1
    for j = 1:sz2
        for n = 1:no_class
            abs_diff = abs(squeeze(BB(i,j,:)) - squeeze(MODEL(n,:)).');
            sum_abs_diff(n) = sum(abs_diff);
        end
        [~,idx] = min(sum_abs_diff);
        ClassMap(i,j) = idx;
    end
end

end