function maze(hostname, portNumber)
    % Instantiate maze objects.
    layoutObject = mazeLayout;
    rewardObject = mazeReward;
    settingsObject = mazeSettings;
    mazeObject = mazeAPI(hostname, portNumber);
    
    % Open maze and connect to it.
    mazeObject.open_maze_program;
    mazeObject.socket = mazeObject.connect_to_maze;
    
    % Setup the maze.
    set_maze_layout(mazeObject, layoutObject);
    set_maze_rewards(mazeObject, rewardObject, layoutObject);
    set_maze_settings(mazeObject, settingsObject);
    
    % Close connection with maze.
    mazeObject.disconnect_from_maze;
end

% TODO: Implement this function.
function give_reward(rewardDuration)
end

% TODO: Implement this function.
function send_to_plexon(eventValue)
end

% TODO: Use layoutType to set specific layout features.
function set_maze_layout(mazeObject, layoutObject)
    % layoutType = layoutObject.typeOfLayout;
    
    % Set maze path starting and ending rows and columns.
    mazeObject.param_maze_path(layoutObject.mazePathRowStart, ...
                               layoutObject.mazePathColumnStart, ...
                               layoutObject.mazePathRowEnd, ...
                               layoutObject.mazePathColumnEnd);
    
    % Set maze seed.
    mazeObject.param_maze_seed(layoutObject.mazeSeed);
    
    % Set maze dimensions.
    mazeObject.param_maze_size(layoutObject.mazeSizeRows, ...
                               layoutObject.mazeSizeColumns);
end

% TODO: Use rewardType to set specific reward features..
function set_maze_rewards(mazeObject, rewardObject, layoutObject)
    % rewardType = rewardObject.typeOfReward;
    
    % Set reward object color.
    mazeObject.param_object_color(rewardObject.objectColor);
    
    % Set reward object dimensions.
    mazeObject.param_object_dimensions(rewardObject.objectDimensionX, ...
                                       rewardObject.objectDimensionY, ...
                                       rewardObject.objectDimensionZ);
    
    % Set reward object position.
    mazeObject.param_object_position(rewardObject.objectPositionX, ...
                                     rewardObject.objectPositionY, ...
                                     rewardObject.objectPositionZ);
    
    % Set reward object rotation vector.
    mazeObject.param_object_rotation_vector(rewardObject.objectRotVectX, ...
                                            rewardObject.objectRotVectY, ...
                                            rewardObject.objectRotVectZ);
    
    % Set reward object shape.
    mazeObject.param_object_shape(rewardObject.objectShape);
    
    % Set reward object rotation speed.
    mazeObject.param_object_rotation_speed(rewardObject.objectSpeed);
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
    
    % Turn on the data output feature.
    mazeObject.param_output_data(settingsObject.outputData);
    
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