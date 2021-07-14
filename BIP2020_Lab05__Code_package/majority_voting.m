function OUT = majority_voting(IN, w_dia)

[sz1,sz2] = size(IN);
OUT = zeros(sz1,sz2);
for x = 1:w_dia:sz1
    for y = 1:w_dia:sz2
        x1 = x;
        x2 = min(x+w_dia-1,sz1);
        y1 = y;
        y2 = min(y+w_dia-1,sz2);
        selected = IN(x1:x2,y1:y2);
        majval = mode(selected,'all');
        OUT(x1:x2,y1:y2) = majval;
    end
end

end