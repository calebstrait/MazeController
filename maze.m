function maze(hostname, portNumber)
    % TEMPORARY VARIABLES TO SIMULATE USER INPUT %
    
    layoutObject = mazeLayout;
    rewardObject = mazeReward;
    
    % ------------------------------------------ %
    
    % Instantiate a mazeAPI object.
    mazeObject = mazeAPI(hostname, portNumber);
    
    mazeObject.open_maze_program;
    
    % Set the socket
    mazeObject.socket = mazeObject.connect_to_maze;
    
    % Setup the maze.
    generate_maze_layout(mazeObject, layoutObject);
    generate_maze_rewards(mazeObject, rewardObject, layoutObject);
    
    mazeObject.disconnect_from_maze;
    
    % TODO: Fix this function in the mazeAPI class; still not working.
    % mazeObject.close_maze_program;
end

% TODO: Implement apply_maze_settings().
% function apply_maze_settings(mazeObject, settingsObject)
% end

% TODO: Implement other layout features.
function generate_maze_layout(mazeObject, layoutObject)
    layoutType = layoutObject.typeOfLayout;
    
    % Set the size and path of the maze.
    mazeObject.param_maze_size(layoutObject.mazeRows, ...
                               layoutObject.mazeColumns);
    mazeObject.param_maze_path(layoutObject.mazePathStartRow, ...
                               layoutObject.mazePathStartColumn, ...
                               layoutObject.mazePathEndRow, ...
                               layoutObject.mazePathEndColumn);
    
    % Make a big room out of the entire maze.
    if strcmp(layoutType, 'bigRoom')
        mazeObject.param_maze_set_room(layoutObject.roomStartRow, ...
                                       layoutObject.roomStartColumn, ...
                                       layoutObject.roomEndRow, ...
                                       layoutObject.roomEndColumn, ...
                                       layoutObject.roomTextureIDWall, ...
                                       layoutObject.roomTextureIDFloor);
    end
end

% TODO: Implement other reward features.
function generate_maze_rewards(mazeObject, rewardObject, layoutObject)
    rewardType = rewardObject.typeOfReward;
    
    % Specifically place a single reward.
    if strcmp(rewardType, 'singleChosen')
        mazeObject.param_object_position(rewardObject.positionX, ...
                                         rewardObject.positionY, ...
                                         rewardObject.positionZ);
    % Place a single reward at the end of the maze path.
    elseif strcmp(rewardType, 'singleEndOfMaze')
        % TODO: Get mazeScale on the fly; don't set a static value.
        mazeScale = 100;
        mazeRows = str2num(layoutObject.mazeRows); %#ok<ST2NM>
        mazeCols = str2num(layoutObject.mazeColumns); %#ok<ST2NM>
        positionX = int2str((mazeCols * mazeScale) - (0.5 * mazeScale));
        positionZ = int2str((mazeRows * mazeScale) - (0.5 * mazeScale));
        
        mazeObject.param_object_position(positionX, ...
                                         rewardObject.positionY, ...
                                         positionZ);
    end
    
    % Set other reward object parameters.
    mazeObject.param_object_color(rewardObject.color);
    mazeObject.param_object_dimensions(rewardObject.dimensionX, ...
                                       rewardObject.dimensionY, ...
                                       rewardObject.dimensionZ);
    mazeObject.param_object_rotation_speed(rewardObject.speed);
    mazeObject.param_object_rotation_vector(rewardObject.rotVectX, ...
                                            rewardObject.rotVectY, ...
                                            rewardObject.rotVectZ);
    mazeObject.param_object_shape(rewardObject.shape);
end