classdef mazeAPI
   properties
       hostname
       portNumber
       socket
   end
   
   methods (Static)
       % Launches maze program, starts maze server, and returns control to MATLAB.
       function open_maze_program()
           system('Maze.exe -serveron &');
       end
       
       % TODO: Figure out why this is not working when MATLAB window loses focus.
       % Closes the maze program.
       function close_maze_program()
           [~, ~] = system('taskkill /IM Maze.exe');
       end
   end
   
   methods
       % Class constructor for mazeAPI.
       function object = mazeAPI(host, port)
           if nargin == 0
               host = '';
               port = 0;
           end
           
           object.hostname = host;
           object.portNumber = port;
           object.socket = 0;
       end
       
       % Property setter for hostname.
       function object = set.hostname(object, host)
           % Makes sure hostname is a string before setting.
           assert(ischar(host), 'Error: hostname must be a string.');
           object.hostname = host;
       end
       
       % Property setter for portNumber.
       function object = set.portNumber(object, port)
           % Makes sure portNumber is a number (type numeric) before setting.
           assert(isnumeric(port), 'Error: portNumber must be a number.');
           object.portNumber = port;
       end
       
       % Property setter for socket.
       function object = set.socket(object, socket)
           % Makes sure socket is a number (type numeric) before setting.
           assert(isnumeric(socket), 'Error: socket must be a number.');
           object.socket = socket;
       end
       
       % Connects to the maze via UDP socket.
       function UDPSocket = connect_to_maze(object)
           % Open a UDP socket.
           UDPSocket = pnet('udpsocket', 81);
           if UDPSocket ~= -1
               try
                   % Connect the destination host to the UDP socket.
                   pnet(UDPSocket, 'udpconnect', ...
                        object.hostname, object.portNumber);
               catch error
                   disp(error);
               end
           else
               disp('Unable to create a UDP socket.');
           end
       end
       
       % Disconnects from the maze by closing the UDP connection.
       function disconnect_from_maze(object)
           pnet(object.socket, 'close');
       end
       
       % Sends a command string to the maze.
       function util_send_command(object, command)
           % Write command to the buffer and then send it to the maze.
           pnet(object.socket, 'write', command);
           pnet(object.socket, 'writepacket', ...
                object.hostname, object.portNumber);
       end
       
       % Sets the maze calibration rectangle.
       function param_calib_rectangle(object, onOff, width, height)
           command = ['CalibRect', ' ', onOff, ' ', width, ' ', height];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the control mode of the maze.
       function param_control_mode(object, keyboard, joystick)
           command = ['CtrlMode', ' ', keyboard, ' ', joystick];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the background color of the maze.
       function param_background_color(object, RGBString)
           command = ['BG_Color', ' ', RGBString];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets whether or not the maze is drawn.
       function param_draw_mode(object, onOff)
           command = ['DrawMode', ' ', onOff];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets how much the camera ("eye") will translate and 
       % rotate with each step.
       function param_eye_move_step(object, translation, rotation)
           command = ['EyeMoveStep', ' ', translation, ' ', rotation];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets camera ("eye") offset from screen center.
       function param_eye_offset(object, x, y)
           command = ['EyeOffset', ' ', x, ' ', y];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets inter-frame duration when maze update commands can be sent.
       function param_get_command_time(object, duration)
           command = ['GetCommandTime', ' ', duration];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets interocular distance.
       function param_io_distance(object, distance)
           command = ['IO_Dist', ' ', distance];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the starting row and column of the maze.
       function param_maze_build_row_col(object, row, column)
           command = ['MazeBuildRowCol', ' ', row, ' ', column];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the starting row and column and ending row and column.
       function param_maze_path(object, startRow, startCol, endRow, endCol)
           command = ['MazePath', ' ', startRow, ' ', startCol, ' ' ...
                      endRow, ' ', endCol];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the scale multiplier of the maze (base unit is 1 cm).
       function param_maze_scale(object, multiplier)
           command = ['MazeScale', ' ', multiplier];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the seed that is used to generate the maze.
       function param_maze_seed(object, seed)
           command = ['MazeSeed', ' ', seed];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets all features of a single cell.
       function param_maze_set_cell(object, row, column, wallEast, ...
                                    wallSouth, wallWest, wallNorth, ...
                                    floorTextureID)
           command = ['MazeSetCell', ' ', row, ' ', column, ' ', ...
                      wallEast, ' ', wallSouth, ' ', wallWest, ' ' ...
                      wallNorth, ' ', floorTextureID];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end                                
       end
       
       % Sets door either on or off at a given cell and direction.
       function param_maze_set_door(object, row, column, onOff)
           command = ['MazeSetDoor', ' ', row, ' ', column, ' ', onOff];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets up a room in the maze.
       function param_maze_set_room(object, startRow, startCol, ...
                                    endRow, endCol, wallTextureID, ...
                                    floorTextureID)
           command = ['MazeSetRoom', ' ', startRow, ' ', startCol, ' ', ...
                      endRow, ' ', endCol, ' ', ...
                      wallTextureID, ' ', floorTextureID];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the size of the maze.
       function params_maze_size(object, numRows, numCols)
           command = ['MazeSize', ' ', numRows, ' ', numCols];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % TODO: Figure out why MazeWallThick can't take two arguments.
       % Sets the thickness of the maze walls.
       function params_maze_wall_thickness(object, thickRatio, eyeRatio)
           command = ['MazeWallThick', ' ', thickRatio, ' ', eyeRatio];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the near and far view clipping planes.
       function params_near_far_clipping(object, near, far)
           command = ['NearFarClip', ' ', near, ' ', far];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the reward object's color.
       function params_object_color(object, RGBString)
           command = ['ObjColor', ' ', RGBString];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the reward object's dimensions.
       function params_object_dimensions(object, x, y, z)
           command = ['ObjDim', ' ', x, ' ', y, ' ', z];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the object's center postion (relative to the entire maze).
       function params_object_position(object, x, y, z)
           command = ['ObjPos', ' ', x, ' ', y, ' ', z];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the reward object's rotation speed.
       function params_object_rotation_speed(object, speed)
           command = ['ObjRotSpeed', ' ', speed];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the object's rotation vector.
       function params_object_rotation_vector(object, x, y, z)
           command = ['ObjRotVector', ' ', x, ' ', y, ' ', z];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the object's shape type.
       function params_object_shape(object, shape)
           command = ['ObjShape', ' ', shape];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the maze to output position data and fetches it.
       function data = param_output_data(object, onOff)
           command = ['OutputData', ' ', onOff];
           
           % Fetch data from maze server.
           if pnet(object.socket, 'status')
               object.util_send_command(command);
               length = pnet(object.socket, 'readpacket');
               waitfor(length);
               
               if length > 0
                   data = pnet(object.socket, 'read');
               end
           end
       end
       
       % Sets the screen size.
       function params_screen_size(object, width, height)
           command = ['ScreenSize', ' ', width, ' ', height];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets camera position.
       function params_set_camera(object, xPos, yPos, zPos, ...
                                  xDir, yDir, zDir)
           command = ['SetCamera', ' ', xPos, ' ', yPos, ' ', zPos, ' ' ...
                      xDir, ' ', yDir, ' ', zDir];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets stereo mode either on or off.
       function params_stereo_enable(object, onOff)
           command = ['StereoEnable', ' ', onOff];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the folder where all texture images are located.
       function params_texture_folder(object, pathString)
           command = ['TextureFolder', ' ', pathString];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the floor texture via image ID in the texture folder.
       function params_floor_texture(object, imageID)
           command = ['TextureIDfloor', ' ', imageID];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the wall texture via image ID in the texture folder.
       function params_wall_texture(object, imageID)
           command = ['TextureIDwall', ' ', imageID];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
       
       % Sets the camera view distance.
       function params_viewing_distance(object, distance)
           command = ['ViewDist', ' ', distance];
           
           if pnet(object.socket, 'status')
               object.util_send_command(command);
           end
       end
   end
end