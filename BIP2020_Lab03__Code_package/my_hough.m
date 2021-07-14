function [H] = my_hough(input_img)
   [szI1, szI2] = size(input_img);
   H = zeros(floor((size(input_img,1)^2 + size(input_img,2)^2) ^ .5),180);
   szH1 = size(H,1);
   for i = 1:szI1
       for j = 1:szI2
           if input_img(i,j) == true
               for k = 1:180
                   rad = k/180 * pi;
                   r = round(i * cos(rad) + j * sin(rad));
                   if r > 0 && r <= szH1
                       H(r,k) = H(r,k) + 1;
                   else
                       continue;
                   end
               end
           end
       end
   end   
           
end