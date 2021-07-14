function H = pmHOG_binner(PHI, MAG)

H = zeros(1,9);
for i = 1:9
    mini = -90+(i-1)*20;
    LOG_MASK = PHI>=mini & PHI<(mini+20);
    H(i) = sum(MAG(LOG_MASK),'all');
end
    
end
