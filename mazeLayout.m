classdef mazeLayout
    properties
        mazeBuildStartColumn
        mazeBuildStartRow
        mazePathColumnEnd
        mazePathColumnStart
        mazePathRowEnd
        mazePathRowStart
        mazeSeed
        mazeSetCellCoordColumn
        mazeSetCellCoordRow
        mazeSetCellDirEast
        mazeSetCellDirNorth
        mazeSetCellDirSouth
        mazeSetCellDirWest
        mazeSetCellFloorTexture
        mazeSetDoorColumn
        mazeSetDoorDirection
        mazeSetDoorRow
        mazeSetRoomColumnEnd
        mazeSetRoomRowEnd
        mazeSetRoomColumnStart
        mazeSetRoomRowStart
        mazeSetRoomTextureIDFloor
        mazeSetRoomTextureIDWall
        mazeSizeColumns
        mazeSizeRows
        typeOfLayout
    end
    
    methods
        % Class constructor for mazeLayout.
        function object = mazeLayout()
            object.mazeBuildStartColumn = '0';
            object.mazeBuildStartRow = '0';
            object.mazePathColumnEnd = '4';
            object.mazePathColumnStart = '0';
            object.mazePathRowEnd = '4';
            object.mazePathRowStart = '0';
            object.mazeSeed = '1';
            object.mazeSetCellCoordColumn = '0';
            object.mazeSetCellCoordRow = '0';
            object.mazeSetCellDirEast = '1';
            object.mazeSetCellDirNorth = '0';
            object.mazeSetCellDirSouth = '1';
            object.mazeSetCellDirWest = '0';
            object.mazeSetCellFloorTexture = '2';
            object.mazeSetDoorColumn = '0';
            object.mazeSetDoorDirection = '0';
            object.mazeSetDoorRow = '0';
            object.mazeSetRoomColumnEnd = '4';
            object.mazeSetRoomRowEnd = '4';
            object.mazeSetRoomColumnStart = '0';
            object.mazeSetRoomRowStart = '0';
            object.mazeSetRoomTextureIDFloor = '5';
            object.mazeSetRoomTextureIDWall = '8';
            object.mazeSizeColumns = '5';
            object.mazeSizeRows = '5';
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
        
        % Property setter for mazePathColumnEnd.
        function object = set.mazePathColumnEnd(object, mazePathColumnEnd)
            % Makes sure mazePathColumnEnd is a string before setting.
            assert(ischar(mazePathColumnEnd), ...
                   'Error: mazePathColumnEnd must be a string.');
            object.mazePathColumnEnd = mazePathColumnEnd;
        end
        
        % Property setter for mazePathColumnStart.
        function object = set.mazePathColumnStart(object, ...
                                                  mazePathColumnStart)
            % Makes sure mazePathColumnStart is a string before setting.
            assert(ischar(mazePathColumnStart), ...
                   'Error: mazePathColumnStart must be a string.');
            object.mazePathColumnStart = mazePathColumnStart;
        end
        
        % Property setter for mazePathRowEnd.
        function object = set.mazePathRowEnd(object, mazePathRowEnd)
            % Makes sure mazePathRowEnd is a string before setting.
            assert(ischar(mazePathRowEnd), ...
                   'Error: mazePathRowEnd must be a string.');
            object.mazePathRowEnd = mazePathRowEnd;
        end
        
        % Property setter for mazePathRowStart.
        function object = set.mazePathRowStart(object, mazePathRowStart)
            % Makes sure mazePathRowStart is a string before setting.
            assert(ischar(mazePathRowStart), ...
                   'Error: mazePathRowStart must be a string.');
            object.mazePathRowStart = mazePathRowStart;
        end
        
        % Property setter for mazeSeed.
        function object = set.mazeSeed(object, mazeSeed)
            % Makes sure mazeSeed is a string before setting.
            assert(ischar(mazeSeed), ...
                   'Error: mazeSeed must be a string.');
            object.mazeSeed = mazeSeed;
        end
        
        % Property setter for setCellCoordColumn.
        function object = set.mazeSetCellCoordColumn(object, ...
                                                     mazeSetCellCoordColumn)
            % Makes sure mazeSetCellCoordColumn is a string before setting.
            assert(ischar(mazeSetCellCoordColumn), ...
                   'Error: mazeSetCellCoordColumn must be a string.');
            object.mazeSetCellCoordColumn = mazeSetCellCoordColumn;
        end
        
        % Property setter for mazeSetCellCoordRow.
        function object = set.mazeSetCellCoordRow(object, ...
                                                  mazeSetCellCoordRow)
            % Makes sure mazeSetCellCoordRow is a string before setting.
            assert(ischar(mazeSetCellCoordRow), ...
                   'Error: mazeSetCellCoordRow must be a string.');
            object.mazeSetCellCoordRow = mazeSetCellCoordRow;
        end
        
        % Property setter for mazeSetCellDirEast.
        function object = set.mazeSetCellDirEast(object, ...
                                                 mazeSetCellDirEast)
            % Makes sure mazeSetCellDirEast is a string before setting.
            assert(ischar(mazeSetCellDirEast), ...
                   'Error: mazeSetCellDirEast must be a string.');
            object.mazeSetCellDirEast = mazeSetCellDirEast;
        end
        
        % Property setter for mazeSetCellDirNorth.
        function object = set.mazeSetCellDirNorth(object, ...
                                                  mazeSetCellDirNorth)
            % Makes sure mazeSetCellDirNorth is a string before setting.
            assert(ischar(mazeSetCellDirNorth), ...
                   'Error: mazeSetCellDirNorth must be a string.');
            object.mazeSetCellDirNorth = mazeSetCellDirNorth;
        end
        
        % Property setter for mazeSetCellDirSouth.
        function object = set.mazeSetCellDirSouth(object, ...
                                                  mazeSetCellDirSouth)
            % Makes sure mazeSetCellDirSouth is a string before setting.
            assert(ischar(mazeSetCellDirSouth), ...
                   'Error: mazeSetCellDirSouth must be a string.');
            object.mazeSetCellDirSouth = mazeSetCellDirSouth;
        end
        
        % Property setter for mazeSetCellDirWest.
        function object = set.mazeSetCellDirWest(object, ...
                                                 mazeSetCellDirWest)
            % Makes sure mazeSetCellDirWest is a string before setting.
            assert(ischar(mazeSetCellDirWest), ...
                   'Error: mazeSetCellDirWest must be a string.');
            object.mazeSetCellDirWest = mazeSetCellDirWest;
        end
        
        % Property setter for mazeSetCellFloorTexture.
        function object = set.mazeSetCellFloorTexture(object, ...
                                                      mazeSetCellFloorTexture)
            % Makes sure mazeSetCellFloorTexture is a string before setting.
            assert(ischar(mazeSetCellFloorTexture), ...
                   'Error: mazeSetCellFloorTexture must be a string.');
            object.mazeSetCellFloorTexture = mazeSetCellFloorTexture;
        end
        
        % Property setter for mazeSetDoorColumn.
        function object = set.mazeSetDoorColumn(object, ...
                                                mazeSetDoorColumn)
            % Makes sure mazeSetDoorColumn is a string before setting.
            assert(ischar(mazeSetDoorColumn), ...
                   'Error: mazeSetDoorColumn must be a string.');
            object.mazeSetDoorColumn = mazeSetDoorColumn;
        end
        
        % Property setter for mazeSetDoorDirection.
        function object = set.mazeSetDoorDirection(object, ...
                                                   mazeSetDoorDirection)
            % Makes sure mazeSetDoorDirection is a string before setting.
            assert(ischar(mazeSetDoorDirection), ...
                   'Error: mazeSetDoorDirection must be a string.');
            object.mazeSetDoorDirection = mazeSetDoorDirection;
        end
        
        % Property setter for mazeSetDoorRow.
        function object = set.mazeSetDoorRow(object, ...
                                             mazeSetDoorRow)
            % Makes sure mazeSetDoorRow is a string before setting.
            assert(ischar(mazeSetDoorRow), ...
                   'Error: mazeSetDoorRow must be a string.');
            object.mazeSetDoorRow = mazeSetDoorRow;
        end
        
        % Property setter for mazeSetRoomColumnEnd.
        function object = set.mazeSetRoomColumnEnd(object, ...
                                                   mazeSetRoomColumnEnd)
            % Makes sure mazeSetRoomColumnEnd is a string before setting.
            assert(ischar(mazeSetRoomColumnEnd), ...
                   'Error: mazeSetRoomColumnEnd must be a string.');
            object.mazeSetRoomColumnEnd = mazeSetRoomColumnEnd;
        end
        
        % Property setter for mazeSetRoomRowEnd.
        function object = set.mazeSetRoomRowEnd(object, mazeSetRoomRowEnd)
            % Makes sure mazeSetRoomRowEnd is a string before setting.
            assert(ischar(mazeSetRoomRowEnd), ...
                   'Error: mazeSetRoomRowEnd must be a string.');
            object.mazeSetRoomRowEnd = mazeSetRoomRowEnd;
        end
        
        % Property setter for mazeSetRoomColumnStart.
        function object = set.mazeSetRoomColumnStart(object, ...
                                                     mazeSetRoomColumnStart)
            % Makes sure mazeSetRoomColumnStart is a string before setting.
            assert(ischar(mazeSetRoomColumnStart), ...
                   'Error: mazeSetRoomColumnStart must be a string.');
            object.mazeSetRoomColumnStart = mazeSetRoomColumnStart;
        end
        
        % Property setter for mazeSetRoomRowStart.
        function object = set.mazeSetRoomRowStart(object, ...
                                                  mazeSetRoomRowStart)
            % Makes sure mazeSetRoomRowStart is a string before setting.
            assert(ischar(mazeSetRoomRowStart), ...
                   'Error: mazeSetRoomRowStart must be a string.');
            object.mazeSetRoomRowStart = mazeSetRoomRowStart;
        end
        
        % Property setter mazeSetRoomTextureIDFloor.
        function object = set.mazeSetRoomTextureIDFloor(object, ...
                                                        mazeSetRoomTextureIDFloor)
            % Makes sure mazeSetRoomTextureIDFloor is a string before setting.
            assert(ischar(mazeSetRoomTextureIDFloor), ...
                   'Error: mazeSetRoomTextureIDFloor must be a string.');
            object.mazeSetRoomTextureIDFloor = mazeSetRoomTextureIDFloor;
        end
        
        % Property setter for mazeSetRoomTextureIDWall.
        function object = set.mazeSetRoomTextureIDWall(object, ...
                                                       mazeSetRoomTextureIDWall)
            % Makes sure mazeSetRoomTextureIDWall is a string before setting.
            assert(ischar(mazeSetRoomTextureIDWall), ...
                   'Error: mazeSetRoomTextureIDWall must be a string.');
            object.mazeSetRoomTextureIDWall = mazeSetRoomTextureIDWall;
        end
        
         % Property setter for mazeSizeColumns.
        function object = set.mazeSizeColumns(object, mazeSizeColumns)
            % Makes sure mazeSizeColumns is a string before setting.
            assert(ischar(mazeSizeColumns), ...
                   'Error: mazeSizeColumns must be a string.');
            object.mazeSizeColumns = mazeSizeColumns;
        end
        
        % Property setter for mazeSizeRows.
        function object = set.mazeSizeRows(object, mazeSizeRows)
            % Makes sure mazeSizeRows is a string before setting.
            assert(ischar(mazeSizeRows), ...
                   'Error: mazeSizeRows must be a string.');
            object.mazeSizeRows = mazeSizeRows;
        end
    end
end