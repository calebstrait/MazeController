function maze(hostname, portNumber)
    % Instantiate a mazeAPI object.
    mazeObject = mazeAPI(hostname, portNumber);
    mazeLayout = mazeLayout();
    
    mazeObject.open_maze_program;
    
    % Set the socket
    mazeObject.socket = mazeObject.connect_to_maze;
    
    % TODO: Finish the setup_maze function.
    % setup_maze(mazeObject);
    
    mazeObject.disconnect_from_maze;
    
    % TODO: Fix this function in the mazeAPI class; still not working.
    % mazeObject.close_maze_program;
end

% TODO: Implement set_initial_params().
function set_initial_params(object)
end

% TODO: Implement generate_maze_layout().
function generate_maze_layout(object)
end

% TODO: Implement generate_maze_rewards().
function generate_maze_rewards(object)
end

% TODO: Flesh out setup_maze and finish called functions.
function setup_maze(object)
    generate_maze_layout(object);
    generate_maze_rewards(object);
    set_initial_params(object);
end