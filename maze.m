function maze(hostname, portNumber)
    % --------------- GLOBALS -------------- %
    
    % TODO: Place most used vars up here; make them accept ints.
    % Distance to reward.
    rewardingRange = 80;
    
    % Instantiated maze objects.
    layoutObject = mazeLayout;
    rewardObject = mazeReward;
    settingsObject = mazeSettings;
    mazeObject = mazeAPI(hostname, portNumber);
    
    % Other variables.
    mazeScale = str2double(settingsObject.mazeScale);
    scaleSubtract = mazeScale / 2;
    juiceDuration = 0.1;
    layoutType = 'regular';    % Values: 'regular' or 'bigRoom'.
    rewardType = 'pathToEnd';  % Values: 'atEnd', 'single', or 'pathToEnd'.
    % TODO: Make these setting work for rewards too.
    dimColumn = '5';
    dimRow = '5';
    rewardColumn = '3';
    rewardRow = '3';
    
    % --------------- SETTINGS ------------- %
    
    % Generate maze layout.
    if strcmp(layoutType, 'regular')
        layoutObject = layout_regular(layoutObject, dimRow, dimColumn);
    elseif strcmp(layoutType, 'bigRoom')
        layoutObject = layout_big_room(layoutObject, dimRow, dimColumn);
    end
    
    % Generate maze reward.
    if strcmp(rewardType, 'atEnd')
        rewardObject = reward_at_end(layoutObject, ...
                                     rewardObject, ...
                                     settingsObject);
        
        objPosX = rewardObject.objectPositionX;
        objPosZ = rewardObject.objectPositionZ;
    elseif strcmp(rewardType, 'single')
        rewardObject = reward_single(rewardObject, ...
                                     settingsObject, ...
                                     rewardRow, ...
                                     rewardColumn);
        
        objPosX = rewardObject.objectPositionX;
        objPosZ = rewardObject.objectPositionZ;
    elseif strcmp(rewardType, 'pathToEnd')
        % Generate all reward object locations.
        rewardPosSeries = get_path(layoutObject);

        % Fetch coordinates for the first reward object position.
        firstPos = rewardPosSeries(1, :);

        if firstPos(2) == 0
            objPosX = scaleSubtract;
        else
            objPosX = firstPos(2) * mazeScale + scaleSubtract;
        end

        if firstPos(1) == 0
            objPosZ = scaleSubtract;
        else
            objPosZ = firstPos(1) * mazeScale + scaleSubtract;
        end

        % Initialize object variables.
        rewardObject.objectPositionX = num2str(objPosX);
        rewardObject.objectPositionZ = num2str(objPosZ);

        % Remove first position from object position array (rewardPosSeries).
        rewardPosSeries(1, :) = [];
    end
    
    % ---------------- CONFIG -------------- %
    
    % Open maze and connect to it.
    mazeObject.open_maze_program;
    mazeObject.socket = mazeObject.connect_to_maze;
    
    % Setup the maze.
    set_maze_layout(mazeObject, layoutObject);
    set_maze_rewards(mazeObject, rewardObject);
    set_maze_settings(mazeObject, settingsObject);
    
    % ----------------- MAIN --------------- %
    
    running = true;
    while running
        % Get maze data from server.
        data = mazeObject.fetch_data('1');
        
        % Parse and store maze data in individual variables.
        dataCellArray  = textscan(data, '%s');
        dataArray = dataCellArray{1};
        camPosX = str2double(dataArray(1));
        camPosZ = str2double(dataArray(3));
        viewObj = str2double(dataArray(7));
        
        % Calculate Euclidean distance to current reward.
        coordMatrix = [camPosX, camPosZ; objPosX, objPosZ];
        distanceToReward = pdist(coordMatrix, 'euclidean');
        
        % Check for a placed reward or a reward at the end.
        if strcmp(rewardType, 'single') || ...
           strcmp(rewardType, 'atEnd')
           % Check if reward should be given (within range and can see object).
            if distanceToReward <= rewardingRange && ...
               viewObj == 1
                % Reward monkey.
                give_reward(juiceDuration);
                
                % Quit loop.
                running = false;
            end
        % Check for a reward in a path.
        elseif strcmp(rewardType, 'pathToEnd')
            % Check if reward should be given (within range and can see object).
            if distanceToReward <= rewardingRange && ...
               viewObj == 1
                % Reward monkey.
                give_reward(juiceDuration);

                % Check if there are any more reward positions
                if isempty(rewardPosSeries)
                    % Hide last reward object in the series.
                    mazeObject.param_object_shape('0');

                    % Quit loop.
                    running = false;
                else
                    % Set next reward position.
                    nextPos = rewardPosSeries(1, :);

                    if nextPos(2) == 0
                        objPosX = scaleSubtract;
                    else
                        objPosX = nextPos(2) * mazeScale + scaleSubtract;
                    end

                    if nextPos(1) == 0
                        objPosZ = scaleSubtract;
                    else
                        objPosZ = nextPos(1) * mazeScale + scaleSubtract;
                    end

                    % Remove this position from the overall reward series.
                    rewardPosSeries(1, :) = [];

                    % Move reward to the new location.
                    objHeight = rewardObject.objectPositionY;

                    mazeObject.param_object_position(num2str(objPosX), ...
                                                     objHeight, ...
                                                     num2str(objPosZ));
                end
            end
        end
    end
    
    % --------------- CLEANUP -------------- %
    
    % Stop data ouput.
    mazeObject.fetch_data('0');
    
    % Close connection with maze.
    mazeObject.disconnect_from_maze;
end

% Gets the series of maze cells that make up the path to the maze end.
% TODO: Eliminate cells that come after reaching the maze end.
function finalPath = get_path(layoutObject)
    columns = str2double(layoutObject.mazeSizeColumns);
    rows = str2double(layoutObject.mazeSizeRows);
    startColumn = str2double(layoutObject.mazeBuildStartColumn);
    startRow = str2double(layoutObject.mazeBuildStartRow);
    mazeSeed = str2double(layoutObject.mazeSeed);
    
    % Find path through entire maze.
    [~, path] = MazeBuilder(rows, columns, startRow, startColumn, mazeSeed); 
    I = path(3, :) ~= 0;
    initialPath = path(1:2, I);
    
    % Format path matrix; reduce the path so that it stops at the maze end.
    transposedMatrix = initialPath';
    matrixDim = size(transposedMatrix);
    numCells = matrixDim(1);
    endColumn = columns - 1;
    endRow = rows - 1;
    lastCell = 0;
    index = 1;
    
    searching = true;
    while searching && index ~= numCells
        cellCoords = transposedMatrix(index, :);
        
        if cellCoords(1) == endRow && cellCoords(2) == endColumn
            lastCell = index;
            searching = false;
        end
        
        index = index + 1;
    end
    
    % Return the shortened maze path (ends at maze end).
    finalPath = transposedMatrix(2:lastCell, :);
end

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
function save_trial_data()
end

% TODO: Implement this function.
function send_to_plexon(eventValue)
end

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
    
    % Set the maze draw mode.
    mazeObject.param_draw_mode(settingsObject.drawMode);
end