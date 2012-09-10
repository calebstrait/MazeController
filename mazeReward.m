classdef mazeReward
    properties
        color
        dimensionX
        dimensionY
        dimensionZ
        positionX
        positionY
        positionZ
        rotationSpeed
        rotationVectorX
        rotationVectorY
        rotationVectorZ
        shape
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
            object.rotationSpeed = '4';
            object.rotationVectorX = '0';
            object.rotationVectorY = '1';
            object.rotationVectorZ = '0';
            object.shape = '1';
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
        
        % Property setter for rotationSpeed.
        function object = set.rotationSpeed(object, rotationSpeed)
            % Makes sure rotationSpeed is a string before setting.
            assert(ischar(rotationSpeed), ...
                   'Error: rotationSpeed must be a string.');
            object.rotationSpeed = rotationSpeed;
        end
        
        % Property setter for rotationVectorX.
        function object = set.rotationVectorX(object, rotationVectorX)
            % Makes sure rotationVectorX is a string before setting.
            assert(ischar(rotationVectorX), ...
                   'Error: rotationVectorX must be a string.');
            object.rotationVectorX = rotationVectorX;
        end
        
        % Property setter for rotationVectorY.
        function object = set.rotationVectorY(object, rotationVectorY)
            % Makes sure rotationVectorY is a string before setting.
            assert(ischar(rotationVectorY), ...
                   'Error: rotationVectorY must be a string.');
            object.rotationVectorY = rotationVectorY;
        end
        
        % Property setter for rotationVectorZ.
        function object = set.rotationVectorZ(object, rotationVectorZ)
            % Makes sure rotationVectorZ is a string before setting.
            assert(ischar(rotationVectorZ), ...
                   'Error: rotationVectorZ must be a string.');
            object.rotationVectorZ = rotationVectorZ;
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