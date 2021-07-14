function MODEL = training_phase(T_cell)

N = numel(T_cell);
h = cell(1,9);
for k=1:9
    h{k} = laws_kernel(k);
end
MODEL = zeros(N,9);
curr_class = cell(1,9);
for i = 1:N
    curr_tex = T_cell{i};
    no_elems = numel(curr_tex);
    for j = 1:9
        curr_class{j} = conv2(curr_tex,h{j},'same');
        curr_class{j} = 1/no_elems * sum(curr_class{j}.^2,'all');
    end
    MODEL(i,:) = [curr_class{:}];
end
    
end
