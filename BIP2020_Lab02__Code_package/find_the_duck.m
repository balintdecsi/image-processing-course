function duck = find_the_duck(I)
	
I_b = I(:,:,3);
duck = I_b < 75;

end