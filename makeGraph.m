[conn,cM,rD]= ImportData();
[weights e_num2] = makeWeights(cM, rD);

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
G2=digraph(startPointVals,endPointVals,weightVals)
title('West and East Hall Step Graph')
axis off
h2=plot(G2,'EdgeLabel',G2.Edges.Weight,'Nodelabel',names2,'EdgeColor','b','NodeColor','r')
