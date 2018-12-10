% Shorest Path Alg for all of Olin Data
% Uses BellmanFord Alg.
% Caluated from step data taken by hand

[cM, wCons]= ImportData(); %Import the connections matrix and the raw weight data
[weights, numEdges, weightsDup] = makeWeights(cM, wCons); %Making weights and numEdge Data. WeightDup has duplicate values will reg weights does not 

N=size(weights,1);% number of nodes
weightVals = zeros(1,numEdges); % Formatting with numEdge index
startPointVals = zeros(1,numEdges); % Formatting with numEdge index
endPointVals = zeros(1,numEdges); % Formatting with numEdge index
index = 1;

% Fill in values for numEdge index data format
for i= 1:N
    for j = 1:N
        if(weightsDup(i,j)~=0)
            weightVals(index) = weightsDup(i,j);
            startPointVals(index) = i;
            endPointVals(index) = j;
            index = index + 1;
        end
    end 
end

%Remove error: since the data was taken by hand, there are some errors in
%our data. These removes the errors of 0 found in our data
startPointVals = startPointVals(1:224);
endPointVals = endPointVals(1:224);
weightVals = weightVals(1:224);

%Setting inital distances to 0
dists = zeros(N);
parentNodes(1:N) = 0;

for j = 1:size(startPointVals,2) %For every edge
    distance = dists(startPointVals(j)) + weightVals(j); %Calculate the new distance
    if distance > dists(endPointVals(j))
        %Update the Distance if it is larger
        dists(endPointVals(j)) = distance;
        parentNodes(endPointVals(j)) = startPointVals(j);
    end
end

destin=input('Where do you want to go?');
totalStepsTaken = dists(destin)