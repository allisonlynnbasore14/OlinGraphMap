load cleared_data.mat
load dummydata.mat


% plot the data for the visualization
plot3(x_data, y_data, z_data,'o-');
hold on
plot3(cx_data, cy_data, cz_data, 'o');


% create adjacent matrices just for 1st data tip
plot3(cx_data(1),cy_data(1), cz_data(1),'o');

% divide multi-floored graph with slices of 2-d graphs
% create arrays for datatips of each floor
floor_1 = [];
floor_2 = [];
floor_3 = [];
floor_4 = [];

% variables for each floor
k1 = 1;
k2 = 1;
k3 = 1;
k4 = 1;

for i = 1:length(cx_data)
    % is there any other way than hard coding the z value?
    % try to implement dictionary? (but will take longer)
    if cz_data(i) == 0
        % is this first floor? yes
        floor_1(k1,1) = cx_data(i);
        floor_1(k1,2) = cy_data(i);
        k1 = k1+1;
    end
    
    if cz_data(i) == 19
        floor_2(k2,1) = cx_data(i);
        floor_2(k2,2) = cy_data(i);
        k2 = k2+1;
    end
    
    if cz_data(i) == 38
        floor_3(k3,1) = cx_data(i);
        floor_3(k3,2) = cy_data(i);
        k3 = k3+1;
    end
    
    if cz_data(i) == 57
        floor_4(k4,1) = cx_data(i);
        floor_4(k4,2) = cy_data(i);
        k4 = k4+1;
    end    
end


        


% create matrices with weights
% apply conditions