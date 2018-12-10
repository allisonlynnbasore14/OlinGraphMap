function [children, children_weights, visited] = make_children(cM, weights, origin, visited)

children = [];              % array of children
children_weights = [];      % array of weights of children
index_children = 1;

    for i = 1:length(cM)
        % if the connection is true, which means two elements are adjacent
        if cM(origin,i) == 1
           status_visited = visited_elements(i, visited);
           % if origin doesn't exist in visited, make children
            if status_visited == 0
                % save the index of children in 'children array'
                children = [children,i];
                % save the weights of children in 'weights array'
                children_weights = [children_weights, weights(origin,i)];
                % append children to visited set
                visited = [visited, origin];
                % index_children = index_children + 1;
            end
        end
    end
end