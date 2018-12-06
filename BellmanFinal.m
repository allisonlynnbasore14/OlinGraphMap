[conn1,cM,rD]= ImportData();
[weights numEdges] = makeWeights(cM, rD);

conn = importdata('NDConn.csv');

N=size(weights,1);         % number of nodes
weightVals = zeros(1,numEdges);
startPointVals = zeros(1,numEdges);
endPointVals = zeros(1,numEdges);
index = 1;


for i= 1:N
    for j = 1:N
        if(weights(i,j)~=0)
            weightVals(index) = weights(i,j);
            startPointVals(index) = i;
            endPointVals(index) = j;
            index = index + 1;
        end
    end 
end

points = [startPointVals;endPointVals]

s2=1;              % Initialization of source node
  
namesBank2={'A','B','C','D','E','F','G','H','L','M','N','O','P','Q','R','S','T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA', 'BB','CC','DD','EE','FF','GG','HH','LL','MM','NN','OO','PP','QQ','RR','SS','TT', 'UU', 'VV', 'WW', 'XX', 'YY', 'ZZ'};
names2 = namesBank2(1:N);
G=graph(startPointVals,endPointVals,weightVals)
title('West and East Hall Step Graph')
axis off
h2=plot(G,'EdgeLabel',G.Edges.Weight,'Nodelabel',names2,'EdgeColor','b','NodeColor','r', 'Layout','force')
masterMatrix = [startPointVals, endPointVals, weightVals];

%Setting inital distances to Inf (source node starts at 0)
dists = zeros(N);
dists(1:N) = Inf;
dists(1) = 0;
parentNodes(1:N) = 0;

for i = 1:N %For every node
    for j = 1:numEdges %For every edge
        distance = dists(startPointVals(j)); %Calculate the new distance
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
p=plot(G,'EdgeLabel',G.Edges.Weight,'Nodelabel',names2,'EdgeColor','k','NodeColor','b', 'Layout','circle')
highlight(p,path,'EdgeColor','g','LineWidth',5);

