function output_img = myconv(input_img, kernel)

sz1 = size(input_img,1);
sz2 = size(input_img,2);
szK1 = (size(kernel,1)-1)/2;
szK2 = (size(kernel,2)-1)/2;
pad_input = padarray(input_img,[szK1 szK2]);
kernel = rot90(kernel,2);
output_img = zeros(sz1,sz2);
for i=1:sz1
    for j=1:sz2
        output_img(i,j) = sum((pad_input(i:(i+2*szK1),j:(j+2*szK2)).*kernel),'all');
    end
end
    
end
