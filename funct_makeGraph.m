function [] = funct_makeGraph(indexA, indexB)

[conn,cM,rD]= ImportData();
[weights, e_num2] = makeWeights(cM, rD);

N=size(weights,1);         % number of nodes
weightVals = zeros(1,e_num2);
startPointVals = zeros(1,e_num2);
endPointVals = zeros(1,e_num2);
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

s2=1;              % Initialization of source node
  
namesBank2={'A','B','C','D','E','F','G','H','L','M','N','O','P','Q','R','S','T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'AA', 'BB','CC','DD','EE','FF','GG','HH','LL','MM','NN','OO','PP','QQ','RR','SS','TT', 'UU', 'VV', 'WW', 'XX', 'YY', 'ZZ'};
names2 = namesBank2(1:N);
G2=digraph(startPointVals,endPointVals,weightVals);

figure;
title('West and East Hall Step Graph')
axis off
h2=plot(G2,'EdgeLabel',G2.Edges.Weight,'Nodelabel',names2,'EdgeColor','b','NodeColor','r');

% substitute diagnoal entries of weights with 0
% M = M - diag(diag(M)) + diag(v)
diagentry = zeros(1,length(weights));
weights_nd = weights - diag(diag(weights)) + diag(diagentry);

% raise an error if same points are set to be start and end
if indexA == indexB
    error('You cannot have identical origin and destination')
end

% Check if two outputs are adjacent

if cM(indexA, indexB) == 1
    output_steps = weights(indexA, indexB);
end

if cM(indexA, indexB) == 0
    % if indexA and index B are not adjacent
   
    % make the list of index
    index_to_search = [];
    % index of index_to_search
    index_index = 1;
    
    % create index_to_search, which is a list of adjacent nodes of indexA
    for i = 1:length(weights)
        if cM(indexA,i) == 1
            index_to_search(index_index) = i;
            index_index = index_index + 1;
        end
    end
    
    display(index_to_search)
    output_steps = 0;
   
end

X = ['Total step number from point ',num2str(indexA),' to point ',num2str(indexB),' is ' ,num2str(output_steps),'.'];
disp(X)
end
% return edge value (Weight)
% If they're not adjacent, make the list of possible routes - use adjacency
% matrix
% calculate the weight of all routes
% sort weights 
% return min / max