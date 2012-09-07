classdef mazeAPI
   properties
       hostname = '';
       portNumber = 0;
       socket = 0;
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
           object.hostname = host;
           object.portNumber = port;
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
   end
end