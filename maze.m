function maze(hostname, portNumber)
    % ----------------------------------------- %
    % ---------------- GLOBALS ---------------- %
    % ----------------------------------------- %
    
    camDirX = '';
    camDirY = '';
    camDirZ = '';
    camPosX = '';
    camPosY = '';
    camPosZ = '';
    viewObj = '';
    
    % ----------------------------------------- %
    % ----------------------------------------- %
    % ----------------------------------------- %
    
    % Instantiate maze objects.
    layoutObject = mazeLayout;
    rewardObject = mazeReward;
    settingsObject = mazeSettings;
    mazeObject = mazeAPI(hostname, portNumber);
    
    % Initialize camera position variables.
    camDirX = settingsObject.setCameraDirX;
    camDirY = settingsObject.setCameraDirY;
    camDirZ = settingsObject.setCameraDirZ;
    camPosX = settingsObject.setCameraPosX;
    camPosY = settingsObject.setCameraPosY;
    camPosZ = settingsObject.setCameraPosZ;
    viewObj = rewardObject.viewingObject;
    
    % Open maze and connect to it.
    mazeObject.open_maze_program;
    mazeObject.socket = mazeObject.connect_to_maze;
    
    % Setup the maze.
    set_maze_layout(mazeObject, layoutObject);
    set_maze_rewards(mazeObject, rewardObject);
    set_maze_settings(mazeObject, settingsObject);
    
    collectTime = 5;
    tic;
    while toc < collectTime
        % Get maze data from server.
        data = mazeObject.fetch_data('1');
        
        % Parse and store maze data.
        dataCellArray  = textscan(data, '%s');
        dataArray = dataCellArray{1};
        camDirX = str2double(dataArray(1));
        camDirY = str2double(dataArray(2));
        camDirZ = str2double(dataArray(3));
        camPosX = str2double(dataArray(4));
        camPosY = str2double(dataArray(5));
        camPosZ = str2double(dataArray(6));
        viewObj = str2double(dataArray(7));
    end
    mazeObject.fetch_data('0');
    
    % Close connection with maze.
    mazeObject.disconnect_from_maze;
end

% Returns the 

% Tunes settings to make a single big room out of the maze.
function layoutObject = layout_big_room(layObj, rows, columns)
    layObj.mazeSetRoomRowEnd = num2str(str2double(rows) - 1);
    layObj.mazeSetRoomColumnEnd = num2str(str2double(columns) - 1);
    layObj.mazeSetRoomColumnStart = '0';
    layObj.mazeSetRoomRowStart = '0';
    layObj.mazeSizeColumns = columns;
    layObj.mazeSizeRows = rows;
    layObj.mazePathColumnEnd = layObj.mazeSetRoomRowEnd;
    layObj.mazePathColumnStart = layObj.mazeSetRoomColumnStart;
    layObj.mazePathRowEnd = layObj.mazeSetRoomRowEnd;
    layObj.mazePathRowStart = layObj.mazeSetRoomRowStart;
    layObj.typeOfLayout = 'bigRoom';
    
    layoutObject = layObj;
end

% Tunes settings to make a regular maze.
function layoutObject = layout_regular(layObj, rows, columns)
    pathRowEnd = num2str(str2double(rows) - 1);
    pathColumnEnd = num2str(str2double(columns) - 1);
    layObj.mazeSizeColumns = columns;
    layObj.mazeSizeRows = rows;
    layObj.mazePathColumnEnd = pathColumnEnd;
    layObj.mazePathRowEnd = pathRowEnd;
    layObj.typeOfLayout = 'regular';
    
    layoutObject = layObj;
end

% Opens the juice line for the passed duration in seconds.
function give_reward(rewardDuration)
    % Set up the channel that controls the juicer.
    juiceLine = 23;
    juiceDIO = digitalio('mcc', 0);
    addline(juiceDIO, juiceLine, 'out');
    
    % Open juicer.
    putvalue(juiceDIO, 1);
    
    % Wait (stay here in code) until rewardDuration has elapsed.
    tic;
    while toc < rewardDuration
    end
    
    % Close juicer.
    putvalue(juiceDIO, 0);
end

% Tunes settings to place a single reward at the end of the maze path.
function rewardObject = reward_at_end(layObj, rewardObj, setObj)
    sizeX = str2double(layObj.mazeSizeColumns);
    sizeZ = str2double(layObj.mazeSizeRows);
    scale = str2double(setObj.mazeScale);
    rewardObj.objectPositionX = num2str(sizeX * scale - scale / 2);
    rewardObj.objectPositionZ = num2str(sizeZ * scale - scale / 2);
    rewardObj.typeOfReward = 'endOfMaze';
    
    rewardObject = rewardObj;
end

% Tunes settings to place a single, specified reward.
function rewardObject = reward_single(rewardObj, setObj, row, column)
    row = str2double(row);
    column = str2double(column);
    scale = str2double(setObj.mazeScale);
    rewardObj.objectPositionX = num2str(column * scale - scale / 2);
    rewardObj.objectPositionZ = num2str(row * scale - scale / 2);
    rewardObj.typeOfReward = 'singleSpecified';
    
    rewardObject = rewardObj;
end

% TODO: Implement this function.
function send_to_plexon(eventValue)
end

% TODO: Use layoutType to set specific layout features.
function set_maze_layout(mazeObject, layoutObject)
    layoutType = layoutObject.typeOfLayout;
    
    % Set maze seed.
    mazeObject.param_maze_seed(layoutObject.mazeSeed);
    
    % Set maze dimensions.
    mazeObject.param_maze_size(layoutObject.mazeSizeRows, ...
                               layoutObject.mazeSizeColumns);
    
    % If called for, make entire maze a big room.
    if strcmp(layoutType, 'bigRoom')
        mazeObject.param_maze_set_room(layoutObject.mazeSetRoomRowStart, ...
                                       layoutObject.mazeSetRoomColumnStart, ...
                                       layoutObject.mazeSetRoomRowEnd, ...
                                       layoutObject.mazeSetRoomColumnEnd, ...
                                       layoutObject.mazeSetRoomTextureIDWall, ...
                                       layoutObject.mazeSetRoomTextureIDFloor);
        
        % Set maze path starting and ending rows and columns.
        mazeObject.param_maze_path(layoutObject.mazePathRowStart, ...
                                   layoutObject.mazePathColumnStart, ...
                                   layoutObject.mazePathRowEnd, ...
                                   layoutObject.mazePathColumnEnd);  
    end
        
    % If called for, make a regular room.
    if strcmp(layoutType, 'regular')
        % Set maze path starting and ending rows and columns.
        mazeObject.param_maze_path(layoutObject.mazePathRowStart, ...
                                   layoutObject.mazePathColumnStart, ...
                                   layoutObject.mazePathRowEnd, ...
                                   layoutObject.mazePathColumnEnd);
    end
end

% TODO: Use rewardType to set specific reward features..
function set_maze_rewards(mazeObject, rewardObject)
    rewardType = rewardObject.typeOfReward;
    
    % Set reward object color.
    mazeObject.param_object_color(rewardObject.objectColor);
    
    % Set reward object dimensions.
    mazeObject.param_object_dimensions(rewardObject.objectDimensionX, ...
                                       rewardObject.objectDimensionY, ...
                                       rewardObject.objectDimensionZ);
    
    % Set reward object rotation vector.
    mazeObject.param_object_rotation_vector(rewardObject.objectRotVectX, ...
                                            rewardObject.objectRotVectY, ...
                                            rewardObject.objectRotVectZ);
    
    % Set reward object shape.
    mazeObject.param_object_shape(rewardObject.objectShape);
    
    % Set reward object rotation speed.
    mazeObject.param_object_rotation_speed(rewardObject.objectSpeed);
    
    % If called for, place a single reward where specified.
    if strcmp(rewardType, 'singleSpecified') || ...
       strcmp(rewardType, 'endOfMaze')
        mazeObject.param_object_position(rewardObject.objectPositionX, ...
                                         rewardObject.objectPositionY, ...
                                         rewardObject.objectPositionZ);
    end
end

function set_maze_settings(mazeObject, settingsObject)
    % Set maze background color.
    mazeObject.param_background_color(settingsObject.backgroundColor);
    
    % Set the calibration rectangle.
    mazeObject.param_calib_rectangle(settingsObject.calibRectOnOff, ...
                                     settingsObject.calibRectHeight, ...
                                     settingsObject.calibRectWidth);
    
    % Set the control mode of the maze.
    mazeObject.param_control_mode(settingsObject.ctrlKeyboard, ...
                                  settingsObject.ctrlMouse);
    
    % Set the maze control mode.
    mazeObject.param_draw_mode(settingsObject.drawMode);
    
    % Set the camera ("eye") movement rates.
    mazeObject.param_eye_move_step(settingsObject.eyeStepTranslate, ...
                                   settingsObject.eyeStepRotate);
    
    % Set the camera ("eye") offset from the center of the screen.
    mazeObject.param_eye_offset(settingsObject.eyeOffsetX, ...
                                settingsObject.eyeOffsetY);
    
    % Set maze command time.
    mazeObject.param_get_command_time(settingsObject.commandTime);
    
    % Set interocular distance.
    mazeObject.param_io_distance(settingsObject.IODistance);
    
    % Set maze scale.
    mazeObject.param_maze_scale(settingsObject.mazeScale);
    
    % Set the maze clipping planes.
    mazeObject.param_near_far_clipping(settingsObject.clipPlaneNear, ...
                                       settingsObject.clipPlaneFar);
    
    % Set screen size.
    mazeObject.param_screen_size(settingsObject.screenSizeWidth, ...
                                 settingsObject.screenSizeHeight);
    
    % Set camera position in the maze.
    mazeObject.param_set_camera(settingsObject.setCameraPosX, ...
                                settingsObject.setCameraPosY, ...
                                settingsObject.setCameraPosZ, ...
                                settingsObject.setCameraDirX, ...
                                settingsObject.setCameraDirY, ...
                                settingsObject.setCameraDirZ);
    
    % Set texture folder path.
    mazeObject.param_texture_folder(settingsObject.textureFolder);
    
    % Set the floor texture ID.
    mazeObject.param_texture_ID_floor(settingsObject.textureIDFloor);
    
    % Set the wall texture ID.
    mazeObject.param_texture_ID_wall(settingsObject.textureIDWall);
    
    % Set the viewing distance.
    mazeObject.param_viewing_distance(settingsObject.viewingDistance);
    
    % Set maze wall thickness ratios.
    mazeObject.param_maze_wall_thickness(settingsObject.wallThickRatio, ...
                                         settingsObject.wallThickEyeRatio);
end