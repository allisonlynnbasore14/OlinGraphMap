% Shorest Path Alg for all of Olin Data
% Uses BellmanFord Alg.
% Caluated from step data taken by hand

[cM, wCons]= ImportData(); %Import the connections matrix and the raw weight data
[weights, numEdges, weightsDup] = makeWeights(cM, wCons); %Making weights and numEdge Data. WeightDup has duplicate values will reg weights does not 
numEdges = numEdges/2;%Taking out the duplicate edges counted

N=size(weights,1); % number of nodes
weightVals = zeros(1,numEdges); % Formatting with numEdge index
startPointVals = zeros(1,numEdges); % Formatting with numEdge index
endPointVals = zeros(1,numEdges); % Formatting with numEdge index
index = 1;


% Fill in values for numEdge index data format
for i= 1:N
    for j = i:N
        if(weights(i,j)~=0)
            weightVals(index) = weights(i,j);
            startPointVals(index) = i;
            endPointVals(index) = j;
            index = index + 1;
        end
    end 
end

%Remove error: since the data was taken by hand, there are some errors in
%our data. These removes the errors of 0 found in our data
startPointVals = startPointVals(1:118);
endPointVals = endPointVals(1:118);
weightVals = weightVals(1:118);
  
namesBank2={'A','B','C','D','E','F','G','H','I', 'J', 'K', 'L','M','N','O','P','Q','R','S','T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA','AB','AC','AD','AE','AF','AG','AH','AI', 'AJ', 'AK','AL','AM','AN','AO','AP','AQ','AR','AS','AT', 'AU', 'AV', 'AW', 'AX', 'AY', 'AZ','BA','BB','BC','BD','BE','BF','BG','BH','BI', 'BJ', 'BK','BL','BM','BN','BO','BP','BQ','BR','BS','BT', 'BU', 'BV', 'BW', 'BX', 'BY', 'BZ'};
names2 = namesBank2(1:N);
G=graph(startPointVals,endPointVals,weightVals)
title('West and East Hall Step Graph')
axis off
h2=plot(G,'EdgeLabel',G.Edges.Weight,'Nodelabel',names2,'EdgeColor','b','NodeColor','r', 'Layout','force')

%Setting inital distances to Inf (source node starts at 0)
dists = zeros(N);
dists(1:N) = Inf;
dists(1) = 0;
parentNodes(1:N) = 0;
for i = 1:N %For every node
    for j = 1:numEdges %For every edge
        distance = dists(startPointVals(j)) + weightVals(j); %Calculate the new distance
        if distance < dists(endPointVals(j))
            %Update the Distance
            dists(endPointVals(j)) = distance;
            parentNodes(endPointVals(j)) = startPointVals(j);
        end
    end
end
destin=input('Where do you want to go?');
totalStepsTaken = dists(destin)
path=shortestpathtree(G,1,destin);
% p=plot(G,'EdgeLabel',G.Edges.Weight,'Nodelabel',names2,'EdgeColor','k','NodeColor','b', 'Layout','circle')
% title('Olin Step Graph')
% axis off

% p=plot(G,'EdgeLabel',G.Edges.Weight,'Nodelabel',names2,'EdgeColor','k','NodeColor','b', 'Layout','force')
% title('Olin Step Graph')
% axis off

p=plot(G,'EdgeLabel',G.Edges.Weight,'Nodelabel',names2,'EdgeColor','k','NodeColor','b', 'Layout','force3')
title('Olin Step Graph')
axis off
highlight(p,path,'EdgeColor','g','LineWidth',5);
title('Olin Step Graph')
axis off

