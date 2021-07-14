function mrf=gmrf_doMMD(mrf)

         cmap = load('MRF_colormap.mat'); % the colormap
            h = mrf.imagesize(1);         % height of the image
            w = mrf.imagesize(2);         % width of the image
         cnum = mrf.classnum;             % number of classes
         beta = mrf.Beta;                 % value of parameter beta
    DeltaUmin = mrf.DeltaUmin;            % value of minimal necessary energy change
            T = mrf.T0;                   % temperature at the beginning
            c = mrf.c;                    % the c constant parameter
     

           cycle = 0;
    summa_deltaE = 2 * DeltaUmin; % the first iteration is guaranteed

    while summa_deltaE > DeltaUmin 
        
        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             BELOW THIS LINE            %
        %                                        %
        % ====================================== %
        
        summa_deltaE = 0;
        cycle = cycle + 1;
        for y = 1:h
            for x = 1:w
                C = mrf.classmask(y,x);
                y1 = max(y-1,1);
                y2 = min(y+1,h);
                x1 = max(x-1,1);
                x2 = min(x+1,w);
                neighborhood = mrf.classmask(y1:y2,x1:x2);
                tmpBeta = logical(neighborhood-C);
                actPostP = mrf.logProbs{C}(y, x);
                coeffBeta = sum(tmpBeta,'all')-(numel(tmpBeta)-1-sum(tmpBeta,'all'));
                actPriorP = beta * coeffBeta;
                actU = actPostP + actPriorP;

                newC = randi(mrf.classnum);
                if newC == C
                    newU = actU;
                else
                    tmpBeta = logical(neighborhood-newC);
                    newPostP = mrf.logProbs{newC}(y, x);
                    coeffBeta = (sum(tmpBeta,'all')-1)-(numel(tmpBeta)-1-(sum(tmpBeta,'all')-1));
                    newPriorP = beta * coeffBeta;
                    newU = newPostP + newPriorP;
                end
                
                dU = newU - actU;
                myRand = randi([0, 4294967295]) / 4294967296.0;
                if dU < 0 || myRand < exp(-dU/T)
                    summa_deltaE = summa_deltaE + abs(dU);
                    mrf.classmask(y,x) = newC;
                end
                
                T = T * c;
            end
        end

        % ====================================== %
        %                                        %
        %    Please, put your implementation     %
        %             ABOVE THIS LINE            %
        %                                        %
        % ====================================== %    
        
        imshow(uint8(255*reshape(cmap.color(mrf.classmask,:), h, w, 3)));
        %fprintf('Iteration #%i\n', cycle);
        title(['Class map in cycle ', num2str(cycle)]);
        drawnow;
    end
end
