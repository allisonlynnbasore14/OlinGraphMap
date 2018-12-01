%File to import Data to make Adj Matrix and Connection Matrix
%Calls Data File and is called by main alg. function
function [connections, connMatrix] = ImportData()

    %Import Data
    rawData = importdata('stepData.xlsx')
    nodeLabels = importdata('nodeLabels.csv')
    connections = importdata('connectionLabels.csv')
    dataLen = size(rawData,1)
    
    %Make Matrix
    connMatrix = zeros(dataLen, dataLen); % A 17 by 17 matrix that shows if nodes are connected or not
    
    for i = 1:dataLen
        for j = 1:dataLen
            valToStore = 0;
            nodeANum = nodeLabels(i);
            nodeBNum = nodeLabels(j);
            if(nodeANum == nodeBNum)
                valToStore = 0;
            else
                for p = 1:size(connections, 2)
                    %iterate through all the connections of Node A
                    if(connections(nodeANum, p) == nodeBNum)
                        valToStore = 1;
                    end
                end
            end
            
            connMatrix(i,j) = valToStore;
        end
    end
    
end

