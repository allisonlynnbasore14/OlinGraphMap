%File to import Data to make Adj Matrix and Connection Matrix
%Calls Data File and is called by main alg. function

%rawData is a 3 colm. matrix that has the x, y, z coordinates of each point
%Each node's number matches its index
%A node's connections can be found in the connection matrix at the index

function [connections, connMatrix, rawData] = ImportData()

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

