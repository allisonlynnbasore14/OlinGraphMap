function [path,total_weights] = call_children(cM, weights, origin, dest)
    total_weights = 0;
    visited = [];
    path = [];
    % path = empty array 
    % initialize 
    
    while origin ~= dest
        if origin == dest
            break
        end
        [children, children_weights, visited] = make_children(cM, weights, origin, visited);
        origin
        [val, index_min] = min(children_weights);
        total_weights = total_weights + children_weights(index_min)
        path = [path, origin];
        origin = children(index_min);
        
        
        
    end
    
end