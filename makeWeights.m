
%This function is called after import data to calcuate the distances
%between points (i.e. the weights)
%It returns a weights matrix that is numberOfNodes by numberOfNodes in size

function [weights, numEdges] = makeWeights(connMatrix, rawData)
    
    N = size(connMatrix,1);
    
    weights = zeros(N,N);

    numEdges = 0;
    for i = 1:N
        for j = 1:N
            valToStore = 0;
            nodeANum = i;
            nodeBNum = j;
            if(nodeANum == nodeBNum)
                valToStore = 0;
            elseif(connMatrix(i,j)==0)
                valToStore = 0;
            else
                x1 = rawData(nodeANum,1);
                y1 = rawData(nodeANum,2);
                z1 = rawData(nodeANum,3);
             
                x2 = rawData(nodeBNum,1);
                y2 = rawData(nodeBNum,2);
                z2 = rawData(nodeBNum,3);
                
                valToStore = sqrt((x2-x1)^2 + (y2-y1)^2 + (z2-z1)^2);
                numEdges = numEdges + 1;
            end
            
            weights(i,j) = valToStore;
        end
    end
end
