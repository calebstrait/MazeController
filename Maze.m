function maze(hostname, portNumber)
    % Array to store initial parameter setting commands.
    commands = [
        {'CalibRect 1 10 10'}, ...
        {'CalibRect 0 10 10'}, ...
        {'CalibRect 1 10 10'}, ...
        {'CalibRect 0 10 10'}, ...
    ];
    
    % Launch maze program, start maze server, and return control to MATLAB.
    system('Maze.exe -serveron &');
    
    % Open a UDP socket connection to the maze program.
    socket = connect_to_maze(hostname, portNumber);
    
    % Set initial parameters for the maze.
    setup_maze(commands, socket, hostname, portNumber);
    
    % Collect maze info continuously.
    get_maze_data(socket, hostname, portNumber);
    
    % Close UDP socket.
    pnet('closeall');
    
    % TODO: Figure out why this is not working when MATLAB window loses focus.
    % Close the maze program.
    [~, ~] = system('taskkill /IM Maze.exe');
end

function udp_socket = connect_to_maze(host, port)
    % Open a UDP socket.
    udp_socket = pnet('udpsocket', 81);
    if udp_socket ~= -1
        try
            % Connect the destination host to the UDP socket.
            pnet(udp_socket, 'udpconnect', host, port);
        catch error
            disp(error);
        end
    else
        disp('Unable to create a UDP socket.');
    end
end

% Gets maze information from the maze server.
function get_maze_data(socket, host, port)
    command = 'OutputData 1';
    
    count = 0;
    status = pnet(socket, 'status');
    while status > 0 && count < 100
        % Write command to get a packet and then read it from the server.
        pnet(socket, 'write', command);
        pnet(socket, 'writepacket', host, port);
        length = pnet(socket, 'readpacket');
        waitfor(length);
        
        % Display the server response.
        if length > 0
            data = pnet(socket, 'read');
            formatedData = sprintf('%s\n', data);
            home;
            disp(formatedData);
        end
        
        status = pnet(socket, 'status');
        count = count + 1;
    end
end

function set_initial_params(commands, socket, host, port)
    % Makes sure the maze controller and maze are still connected via socket.
    if pnet(socket, 'status')
        % Send each parameter setting command to the maze.
        length = size(commands);
        for i = 1:length(2)
            pnet(socket, 'write', char(commands(i)));
            pnet(socket, 'writepacket', host, port);
            pause(1);
        end
    else
        disp('No longer connected to the maze via socket.');
    end
end

% TODO: Add maze building.
% Initialize maze settings.
function setup_maze(commands, socket, host, port)
    set_initial_params(commands, socket, host, port);
end