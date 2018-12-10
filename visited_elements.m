function status_visited = visited_elements(input, visited)
    status_visited = 0;
    for i = 1:length(visited)
        if visited(i) == input
            status_visited = 1;
            break
        end
    end
        
end