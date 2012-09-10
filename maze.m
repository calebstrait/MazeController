function maze(hostname, portNumber)
    % TEMPORARY VARIABLES TO SIMULATE USER INPUT %
    
    layoutObject = mazeLayout;
    rewardObject = mazeReward;
    settingsObject = mazeSettings;
    
    % ------------------------------------------ %
    
    % Instantiate a mazeAPI object.
    mazeObject = mazeAPI(hostname, portNumber);
    
    mazeObject.open_maze_program;
    
    % Set the socket
    mazeObject.socket = mazeObject.connect_to_maze;
    
    % Setup the maze.
    generate_maze_layout(mazeObject, layoutObject);
    generate_maze_rewards(mazeObject, rewardObject);
    apply_maze_settings(mazeObject, settingsObject);
    
    mazeObject.disconnect_from_maze;
    
    % TODO: Fix this function in the mazeAPI class; still not working.
    % mazeObject.close_maze_program;
end

% TODO: Implement apply_maze_settings().
function apply_maze_settings(mazeObject, settingsObject)
end

% TODO: Implement generate_maze_layout().
function generate_maze_layout(mazeObject, layoutObject)
end

% TODO: Implement generate_maze_rewards().
function generate_maze_rewards(mazeObject, rewardObject)
end