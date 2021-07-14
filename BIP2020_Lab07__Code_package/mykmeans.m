function [LUT, M] = mykmeans(S, k)
    
[LUT, M] = step1_initialization(S,k);
t = 0;
converged = false;
while ~converged && t < 100
    LUT = step2_assignment(S,k,LUT,M);
    prevM = M;
    M = step3_update(S,k,LUT,M);
    converged = (sum(abs(M - prevM).^2,'all') < .02);
    t = t + 1;
end
fprintf('Iteration finished after %d steps.\n', t);

end
