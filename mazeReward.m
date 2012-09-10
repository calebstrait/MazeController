classdef mazeReward
    properties
        color
        dimensionX
        dimensionY
        dimensionZ
        positionX
        positionY
        positionZ
        rotVectX
        rotVectY
        rotVectZ
        shape
        speed
        typeOfReward
    end
    
    methods
        % Class constructor for mazeReward.
        function object = mazeReward()
            object.color = '255 0 0';
            object.dimensionX = '10';
            object.dimensionY = '10';
            object.dimensionZ = '10';
            object.positionX = '50';
            object.positionY = '50';
            object.positionZ = '250';
            object.speed = '4';
            object.rotVectX = '0';
            object.rotVectY = '1';
            object.rotVectZ = '0';
            object.shape = '1';
            object.typeOfReward = 'singleEndOfMaze';
        end
        
        % Property setter for color.
        function object = set.color(object, color)
            % Makes sure color is a string before setting.
            assert(ischar(color), ...
                   'Error: color must be a string.');
            object.color = color;
        end
        
        % Property setter for dimensionX.
        function object = set.dimensionX(object, dimensionX)
            % Makes sure dimensionX is a string before setting.
            assert(ischar(dimensionX), ...
                   'Error: dimensionX must be a string.');
            object.dimensionX = dimensionX;
        end
        
        % Property setter for dimensionY.
        function object = set.dimensionY(object, dimensionY)
            % Makes sure dimensionY is a string before setting.
            assert(ischar(dimensionY), ...
                   'Error: dimensionY must be a string.');
            object.dimensionY = dimensionY;
        end
        
        % Property setter for dimensionZ.
        function object = set.dimensionZ(object, dimensionZ)
            % Makes sure dimensionZ is a string before setting.
            assert(ischar(dimensionZ), ...
                   'Error: dimensionZ must be a string.');
            object.dimensionZ = dimensionZ;
        end
        
        % Property setter for positionX.
        function object = set.positionX(object, positionX)
            % Makes sure positionX is a string before setting.
            assert(ischar(positionX), ...
                   'Error: positionX must be a string.');
            object.positionX = positionX;
        end
        
        % Property setter for positionY.
        function object = set.positionY(object, positionY)
            % Makes sure positionY is a string before setting.
            assert(ischar(positionY), ...
                   'Error: positionY must be a string.');
            object.positionY = positionY;
        end
        
        % Property setter for positionZ.
        function object = set.positionZ(object, positionZ)
            % Makes sure positionZ is a string before setting.
            assert(ischar(positionZ), ...
                   'Error: positionZ must be a string.');
            object.positionZ = positionZ;
        end
        
        % Property setter for speed.
        function object = set.speed(object, speed)
            % Makes sure speed is a string before setting.
            assert(ischar(speed), ...
                   'Error: speed must be a string.');
            object.speed = speed;
        end
        
        % Property setter for rotVectX.
        function object = set.rotVectX(object, rotVectX)
            % Makes sure rotVectX is a string before setting.
            assert(ischar(rotVectX), ...
                   'Error: rotVectX must be a string.');
            object.rotVectX = rotVectX;
        end
        
        % Property setter for rotVectY.
        function object = set.rotVectY(object, rotVectY)
            % Makes sure rotVectY is a string before setting.
            assert(ischar(rotVectY), ...
                   'Error: rotVectY must be a string.');
            object.rotVectY = rotVectY;
        end
        
        % Property setter for rotVectZ.
        function object = set.rotVectZ(object, rotVectZ)
            % Makes sure rotVectZ is a string before setting.
            assert(ischar(rotVectZ), ...
                   'Error: rotVectZ must be a string.');
            object.rotVectZ = rotVectZ;
        end
        
        % Property setter for shape.
        function object = set.shape(object, shape)
            % Makes sure shape is a string before setting.
            assert(ischar(shape), ...
                   'Error: shape must be a string.');
            object.shape = shape;
        end
    end
end