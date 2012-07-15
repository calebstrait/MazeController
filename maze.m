function maze(hostname, portNumber)
    % Launch the maze program.
    % !Maze.exe
    
    % Start the maze program's server.
    
    % Open a UDP socket connection to the maze program.
    socket = connect_to_maze(hostname, portNumber);
    
    % Set initial parameters for the maze.
    
    % Collect maze info continuously.
    get_maze_data(socket, hostname, portNumber);
    
    % Close UDP socket.
    pnet('closeall');
end

function udp_socket = connect_to_maze(host, port)
    % Open a UDP socket.
    udp_socket = pnet('udpsocket', 81);

    if udp_socket ~= -1
        try
            % Connect the destination host to the UDP socket.
            pnet(udp_socket, 'udpconnect', host, port);

            % Display the server's IP.
            [IP, portNum] = pnet(udp_socket, 'gethost');
            address = sprintf('Server IP:% d.%d.%d.%d:%d\n', IP, portNum);
            disp(address);
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

    status = pnet(socket, 'status');
    while status > 0
        % Read the next packet from the server.
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
    end
end