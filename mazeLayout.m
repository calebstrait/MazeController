classdef mazeLayout
    properties
        mazeBuildStartColumn
        mazeBuildStartRow
        mazePathEndColumn
        mazePathEndRow
        mazeColumns
        mazeRows
        mazePathStartRow
        mazePathStartColumn
        mazeSeed
        mazeTextureIDFloor
        mazeTextureIDWall
        roomEndColumn
        roomEndRow
        roomStartColumn
        roomStartRow
        roomTextureIDFloor
        roomTextureIDWall
        typeOfLayout
    end
    
    methods
        % Class constructor for mazeLayout.
        function object = mazeLayout()
            object.mazeBuildStartColumn = '0';
            object.mazeBuildStartRow = '0';
            object.mazePathEndColumn = '4';
            object.mazePathEndRow = '4';
            object.mazeColumns = '5';
            object.mazeRows = '5';
            object.mazePathStartRow = '0';
            object.mazePathStartColumn = '0';
            object.mazeSeed = '2';
            object.mazeTextureIDFloor = '5';
            object.mazeTextureIDWall = '8';
            object.roomEndColumn = '4';
            object.roomEndRow = '4';
            object.roomStartColumn = '0';
            object.roomStartRow = '0';
            object.roomTextureIDFloor = '5';
            object.roomTextureIDWall = '8';
            object.typeOfLayout = 'regularMaze';
        end
        
        % Property setter for mazeBuildStartColumn.
        function object = set.mazeBuildStartColumn(object, ...
                                                   mazeBuildStartColumn)
            % Makes sure mazeBuildStartColumn is a string before setting.
            assert(ischar(mazeBuildStartColumn), ...
                   'Error: mazeBuildStartColumn must be a string.');
            object.mazeBuildStartColumn = mazeBuildStartColumn;
        end
        
        % Property setter for mazeBuildStartRow.
        function object = set.mazeBuildStartRow(object, mazeBuildStartRow)
            % Makes sure mazeBuildStartRow is a string before setting.
            assert(ischar(mazeBuildStartRow), ...
                   'Error: mazeBuildStartRow must be a string.');
            object.mazeBuildStartRow = mazeBuildStartRow;
        end
        
        % Property setter for mazePathEndColumn.
        function object = set.mazePathEndColumn(object, mazePathEndColumn)
            % Makes sure mazePathEndColumn is a string before setting.
            assert(ischar(mazePathEndColumn), ...
                   'Error: mazePathEndColumn must be a string.');
            object.mazePathEndColumn = mazePathEndColumn;
        end
        
        % Property setter for mazePathEndRow.
        function object = set.mazePathEndRow(object, mazePathEndRow)
            % Makes sure mazePathEndRow is a string before setting.
            assert(ischar(mazePathEndRow), ...
                   'Error: mazePathEndRow must be a string.');
            object.mazePathEndRow = mazePathEndRow;
        end
        
        % Property setter for mazeColumns.
        function object = set.mazeColumns(object, mazeColumns)
            % Makes sure mazeColumns is a string before setting.
            assert(ischar(mazeColumns), ...
                   'Error: mazeColumns must be a string.');
            object.mazeColumns = mazeColumns;
        end
        
        % Property setter for mazeRows.
        function object = set.mazeRows(object, mazeRows)
            % Makes sure mazeRows is a string before setting.
            assert(ischar(mazeRows), ...
                   'Error: mazeRows must be a string.');
            object.mazeRows = mazeRows;
        end
        
        % Property setter for mazePathStartRow.
        function object = set.mazePathStartRow(object, mazePathStartRow)
            % Makes sure mazePathStartRow is a string before setting.
            assert(ischar(mazePathStartRow), ...
                   'Error: mazePathStartRow must be a string.');
            object.mazePathStartRow = mazePathStartRow;
        end
        
        % Property setter for mazePathStartColumn.
        function object = set.mazePathStartColumn(object, ...
                                                  mazePathStartColumn)
            % Makes sure mazePathStartColumn is a string before setting.
            assert(ischar(mazePathStartColumn), ...
                   'Error: mazePathStartColumn must be a string.');
            object.mazePathStartColumn = mazePathStartColumn;
        end
        
        % Property setter for mazeSeed.
        function object = set.mazeSeed(object, mazeSeed)
            % Makes sure mazeSeed is a string before setting.
            assert(ischar(mazeSeed), ...
                   'Error: mazeSeed must be a string.');
            object.mazeSeed = mazeSeed;
        end
        
        % Property setter for mazeTextureIDFloor.
        function object = set.mazeTextureIDFloor(object, ...
                                                 mazeTextureIDFloor)
            % Makes sure mazeTextureIDFloor is a string before setting.
            assert(ischar(mazeTextureIDFloor), ...
                   'Error: mazeTextureIDFloor must be a string.');
            object.mazeTextureIDFloor = mazeTextureIDFloor;
        end
        
        % Property setter for mazeTextureIDWall.
        function object = set.mazeTextureIDWall(object, mazeTextureIDWall)
            % Makes sure mazeTextureIDWall is a string before setting.
            assert(ischar(mazeTextureIDWall), ...
                   'Error: mazeTextureIDWall must be a string.');
            object.mazeTextureIDWall = mazeTextureIDWall;
        end
        
        % Property setter for roomEndColumn.
        function object = set.roomEndColumn(object, roomEndColumn)
            % Makes sure roomEndColumn is a string before setting.
            assert(ischar(roomEndColumn), ...
                   'Error: roomEndColumn must be a string.');
            object.roomEndColumn = roomEndColumn;
        end
        
        % Property setter for roomEndRow.
        function object = set.roomEndRow(object, roomEndRow)
            % Makes sure roomEndRow is a string before setting.
            assert(ischar(roomEndRow), ...
                   'Error: roomEndRow must be a string.');
            object.roomEndRow = roomEndRow;
        end
        
        % Property setter for roomStartColumn.
        function object = set.roomStartColumn(object, roomStartColumn)
            % Makes sure roomStartColumn is a string before setting.
            assert(ischar(roomStartColumn), ...
                   'Error: roomStartColumn must be a string.');
            object.roomStartColumn = roomStartColumn;
        end
        
        % Property setter for roomStartRow.
        function object = set.roomStartRow(object, roomStartRow)
            % Makes sure roomStartRow is a string before setting.
            assert(ischar(roomStartRow), ...
                   'Error: roomStartRow must be a string.');
            object.roomStartRow = roomStartRow;
        end
        
        % Property setter forroomTextureIDFloor.
        function object = set.roomTextureIDFloor(object, ...
                                                 roomTextureIDFloor)
            % Makes sure roomTextureIDFloor is a string before setting.
            assert(ischar(roomTextureIDFloor), ...
                   'Error: roomTextureIDFloor must be a string.');
            object.roomTextureIDFloor = roomTextureIDFloor;
        end
        
        % Property setter for roomTextureIDWall.
        function object = set.roomTextureIDWall(object, roomTextureIDWall)
            % Makes sure roomTextureIDWall is a string before setting.
            assert(ischar(roomTextureIDWall), ...
                   'Error: roomTextureIDWall must be a string.');
            object.roomTextureIDWall = roomTextureIDWall;
        end
    end
end