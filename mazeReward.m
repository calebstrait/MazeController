classdef mazeReward
    properties
        objectColor
        objectDimensionX
        objectDimensionY
        objectDimensionZ
        objectPositionX
        objectPositionY
        objectPositionZ
        objectRotVectX
        objectRotVectY
        objectRotVectZ
        objectShape
        objectSpeed
        typeOfReward
        viewingObject
    end
    
    methods
        % Class constructor for mazeReward.
        function object = mazeReward()
            object.objectColor = '255 0 0';
            object.objectDimensionX = '20';
            object.objectDimensionY = '20';
            object.objectDimensionZ = '20';
            object.objectPositionX = '50';
            object.objectPositionY = '50';
            object.objectPositionZ = '250';
            object.objectRotVectX = '0';
            object.objectRotVectY = '1';
            object.objectRotVectZ = '0';
            object.objectShape = '1';
            object.objectSpeed = '4';
            object.typeOfReward = 'endOfMaze';
            object.viewingObject = '0';
        end
        
        % Property setter for objectColor.
        function object = set.objectColor(object, objectColor)
            % Makes sure objectColor is a string before setting.
            assert(ischar(objectColor), ...
                   'Error: objectColor must be a string.');
            object.objectColor = objectColor;
        end
        
        % Property setter for objectDimensionX.
        function object = set.objectDimensionX(object, objectDimensionX)
            % Makes sure objectDimensionX is a string before setting.
            assert(ischar(objectDimensionX), ...
                   'Error: objectDimensionX must be a string.');
            object.objectDimensionX = objectDimensionX;
        end
        
        % Property setter for objectDimensionY.
        function object = set.objectDimensionY(object, objectDimensionY)
            % Makes sure objectDimensionY is a string before setting.
            assert(ischar(objectDimensionY), ...
                   'Error: objectDimensionY must be a string.');
            object.objectDimensionY = objectDimensionY;
        end
        
        % Property setter for objectDimensionZ.
        function object = set.objectDimensionZ(object, objectDimensionZ)
            % Makes sure objectDimensionZ is a string before setting.
            assert(ischar(objectDimensionZ), ...
                   'Error: objectDimensionZ must be a string.');
            object.objectDimensionZ = objectDimensionZ;
        end
        
        % Property setter for objectPositionX.
        function object = set.objectPositionX(object, objectPositionX)
            % Makes sure objectPositionX is a string before setting.
            assert(ischar(objectPositionX), ...
                   'Error: objectPositionX must be a string.');
            object.objectPositionX = objectPositionX;
        end
        
        % Property setter for objectPositionY.
        function object = set.objectPositionY(object, objectPositionY)
            % Makes sure objectPositionY is a string before setting.
            assert(ischar(objectPositionY), ...
                   'Error: objectPositionY must be a string.');
            object.objectPositionY = objectPositionY;
        end
        
        % Property setter for objectPositionZ.
        function object = set.objectPositionZ(object, objectPositionZ)
            % Makes sure objectPositionZ is a string before setting.
            assert(ischar(objectPositionZ), ...
                   'Error: objectPositionZ must be a string.');
            object.objectPositionZ = objectPositionZ;
        end
        
        % Property setter for objectRotVectX.
        function object = set.objectRotVectX(object, objectRotVectX)
            % Makes sure objectRotVectX is a string before setting.
            assert(ischar(objectRotVectX), ...
                   'Error: objectRotVectX must be a string.');
            object.objectRotVectX = objectRotVectX;
        end
        
        % Property setter for objectRotVectY.
        function object = set.objectRotVectY(object, objectRotVectY)
            % Makes sure objectRotVectY is a string before setting.
            assert(ischar(objectRotVectY), ...
                   'Error: objectRotVectY must be a string.');
            object.objectRotVectY = objectRotVectY;
        end
        
        % Property setter for objectRotVectZ.
        function object = set.objectRotVectZ(object, objectRotVectZ)
            % Makes sure objectRotVectZ is a string before setting.
            assert(ischar(objectRotVectZ), ...
                   'Error: objectRotVectZ must be a string.');
            object.objectRotVectZ = objectRotVectZ;
        end
        
        % Property setter for objectShape.
        function object = set.objectShape(object, objectShape)
            % Makes sure objectShape is a string before setting.
            assert(ischar(objectShape), ...
                   'Error: objectShape must be a string.');
            object.objectShape = objectShape;
        end
        
        % Property setter for objectSpeed.
        function object = set.objectSpeed(object, objectSpeed)
            % Makes sure objectSpeed is a string before setting.
            assert(ischar(objectSpeed), ...
                   'Error: objectSpeed must be a string.');
            object.objectSpeed = objectSpeed;
        end
        
        % Property setter for viewingObject.
        function object = set.viewingObject(object, viewingObject)
            % Makes sure viewingObject is a string before setting.
            assert(ischar(viewingObject), ...
                   'Error: viewingObject must be a string.');
            object.viewingObject = viewingObject;
        end
    end
end