classdef mazeSettings
    properties
        backgroundColor
        calibRectOnOff
        calibRectHeight
        calibRectWidth
        clipPlaneNear
        clipPlaneFar
        commandTime
        ctrlKeyboard
        ctrlMouse
        drawMode
        eyeOffsetX
        eyeOffsetY
        eyeStepRotate
        eyeStepTranslate
        IODistance
        mazeScale
        outputData
        screenSizeHeight
        screenSizeWidth
        setCameraDirX
        setCameraDirY
        setCameraDirZ
        setCameraPosX
        setCameraPosY
        setCameraPosZ
        textureFolder
        textureIDFloor
        textureIDWall
        viewingDistance
        wallThickRatio
        wallThickEyeRatio
    end
    
    methods
        % Class constructor for mazeSettings.
        function object = mazeSettings()
            object.backgroundColor = '135 206 250';
            object.calibRectOnOff = '0';
            object.calibRectHeight = '10';
            object.calibRectWidth = '10';
            object.clipPlaneNear = '1';
            object.clipPlaneFar = '1000000';
            object.commandTime = '3';
            object.ctrlKeyboard = '1';
            object.ctrlMouse = '1';
            object.drawMode = '1';
            object.eyeOffsetX = '0';
            object.eyeOffsetY = '0';
            object.eyeStepRotate = '2';
            object.eyeStepTranslate = '2';
            object.IODistance = '0';
            object.mazeScale = '100';
            object.outputData = '0';
            object.screenSizeHeight = '29.5';
            object.screenSizeWidth = '47.5';
            object.setCameraDirX = '0';
            object.setCameraDirY = '0';
            object.setCameraDirZ = '1';
            object.setCameraPosX = '50';
            object.setCameraPosY = '100';
            object.setCameraPosZ = '50';
            object.textureFolder = 'C:\Users\bhayden\Documents\AaronCode\AaronMATLAB\MazeController\image';
            object.textureIDFloor = '3';
            object.textureIDWall = '6';
            object.viewingDistance = '30';
            object.wallThickRatio = '0.02';
            object.wallThickEyeRatio = '0.1';
        end
        
        % Property setter for backgroundColor.
        function object = set.backgroundColor(object, backgroundColor)
            % Makes sure backgroundColor is a string before setting.
            assert(ischar(backgroundColor), ...
                   'Error: backgroundColor must be a string.');
            object.backgroundColor = backgroundColor;
        end
        
        % Property setter for calibRectOnOff.
        function object = set.calibRectOnOff(object, calibRectOnOff)
            % Makes sure calibRectOnOff is a string before setting.
            assert(ischar(calibRectOnOff), ...
                   'Error: calibRectOnOff must be a string.');
            object.calibRectOnOff = calibRectOnOff;
        end
        
        % Property setter for calibRectHeight.
        function object = set.calibRectHeight(object, calibRectHeight)
            % Makes sure calibRectHeight is a string before setting.
            assert(ischar(calibRectHeight), ...
                   'Error: calibRectHeight must be a string.');
            object.calibRectHeight = calibRectHeight;
        end
        
        % Property setter for calibRectWidth.
        function object = set.calibRectWidth(object, calibRectWidth)
            % Makes sure calibRectWidth is a string before setting.
            assert(ischar(calibRectWidth), ...
                   'Error: calibRectWidth must be a string.');
            object.calibRectWidth = calibRectWidth;
        end
        
        % Property setter for commandTime.
        function object = set.commandTime(object, commandTime)
            % Makes sure commandTime is a string before setting.
            assert(ischar(commandTime), ...
                   'Error: commandTime must be a string.');
            object.commandTime = commandTime;
        end
        
        % Property setter for ctrlKeyboard.
        function object = set.ctrlKeyboard(object, ctrlKeyboard)
            % Makes sure ctrlKeyboard is a string before setting.
            assert(ischar(ctrlKeyboard), ...
                   'Error: ctrlKeyboard must be a string.');
            object.ctrlKeyboard = ctrlKeyboard;
        end
        
        % Property setter for ctrlMouse.
        function object = set.ctrlMouse(object, ctrlMouse)
            % Makes sure ctrlMouse is a string before setting.
            assert(ischar(ctrlMouse), ...
                   'Error: ctrlMouse must be a string.');
            object.ctrlMouse = ctrlMouse;
        end
        
        % Property setter for drawMode.
        function object = set.drawMode(object, drawMode)
            % Makes sure drawMode is a string before setting.
            assert(ischar(drawMode), ...
                   'Error: drawMode must be a string.');
            object.drawMode = drawMode;
        end
        
        % Property setter for eyeOffsetX.
        function object = set.eyeOffsetX(object, eyeOffsetX)
            % Makes sure eyeOffsetX is a string before setting.
            assert(ischar(eyeOffsetX), ...
                   'Error: eyeOffsetX must be a string.');
            object.eyeOffsetX = eyeOffsetX;
        end
        
        % Property setter for eyeOffsetY.
        function object = set.eyeOffsetY(object, eyeOffsetY)
            % Makes sure eyeOffsetY is a string before setting.
            assert(ischar(eyeOffsetY), ...
                   'Error: eyeOffsetY must be a string.');
            object.eyeOffsetY = eyeOffsetY;
        end
        
        % Property setter for eyeStepRotate.
        function object = set.eyeStepRotate(object, eyeStepRotate)
            % Makes sure eyeStepRotate is a string before setting.
            assert(ischar(eyeStepRotate), ...
                   'Error: eyeStepRotate must be a string.');
            object.eyeStepRotate = eyeStepRotate;
        end
        
        % Property setter for eyeStepTranslate.
        function object = set.eyeStepTranslate(object, eyeStepTranslate)
            % Makes sure eyeStepTranslate is a string before setting.
            assert(ischar(eyeStepTranslate), ...
                   'Error: eyeStepTranslate must be a string.');
            object.eyeStepTranslate = eyeStepTranslate;
        end
        
        % Property setter for IODistance.
        function object = set.IODistance(object, IODistance)
            % Makes sure IODistance is a string before setting.
            assert(ischar(IODistance), ...
                   'Error: IODistance must be a string.');
            object.IODistance = IODistance;
        end
        
        % Property setter for mazeScale.
        function object = set.mazeScale(object, mazeScale)
            % Makes sure mazeScale is a string before setting.
            assert(ischar(mazeScale), ...
                   'Error: mazeScale must be a string.');
            object.mazeScale = mazeScale;
        end
        
        % Property setter for clipPlaneNear.
        function object = set.clipPlaneNear(object, ...
                                            clipPlaneNear)
            % Makes sure clipPlaneNear is a string before setting.
            assert(ischar(clipPlaneNear), ...
                   'Error: clipPlaneNear must be a string.');
            object.clipPlaneNear = clipPlaneNear;
        end
        
        % Property setter for clipPlaneFar.
        function object = set.clipPlaneFar(object, ...
                                           clipPlaneFar)
            % Makes sure clipPlaneFar is a string before setting.
            assert(ischar(clipPlaneFar), ...
                   'Error: clipPlaneFar must be a string.');
            object.clipPlaneFar = clipPlaneFar;
        end
        
        % Property setter for outputData.
        function object = set.outputData(object, ...
                                         outputData)
            % Makes sure outputData is a string before setting.
            assert(ischar(outputData), ...
                   'Error: outputData must be a string.');
            object.outputData = outputData;
        end
        
        % Property setter for screenSizeHeight.
        function object = set.screenSizeHeight(object, ...
                                               screenSizeHeight)
            % Makes sure screenSizeHeight is a string before setting.
            assert(ischar(screenSizeHeight), ...
                   'Error: screenSizeHeight must be a string.');
            object.screenSizeHeight = screenSizeHeight;
        end
        
        % Property setter for screenSizeWidth.
        function object = set.screenSizeWidth(object, ...
                                              screenSizeWidth)
            % Makes sure screenSizeWidth is a string before setting.
            assert(ischar(screenSizeWidth), ...
                   'Error: screenSizeWidth must be a string.');
            object.screenSizeWidth = screenSizeWidth;
        end
        
        % Property setter for setCameraDirX.
        function object = set.setCameraDirX(object, ...
                                            setCameraDirX)
            % Makes sure setCameraDirX is a string before setting.
            assert(ischar(setCameraDirX), ...
                   'Error: setCameraDirX must be a string.');
            object.setCameraDirX = setCameraDirX;
        end
        
        % Property setter for setCameraDirY.
        function object = set.setCameraDirY(object, ...
                                            setCameraDirY)
            % Makes sure setCameraDirY is a string before setting.
            assert(ischar(setCameraDirY), ...
                   'Error: setCameraDirY must be a string.');
            object.setCameraDirY = setCameraDirY;
        end
        
        % Property setter for setCameraDirZ.
        function object = set.setCameraDirZ(object, ...
                                            setCameraDirZ)
            % Makes sure setCameraDirZ is a string before setting.
            assert(ischar(setCameraDirZ), ...
                   'Error: setCameraDirZ must be a string.');
            object.setCameraDirZ = setCameraDirZ;
        end
        
        % Property setter for setCameraPosX.
        function object = set.setCameraPosX(object, ...
                                            setCameraPosX)
            % Makes sure setCameraPosX is a string before setting.
            assert(ischar(setCameraPosX), ...
                   'Error: setCameraPosX must be a string.');
            object.setCameraPosX = setCameraPosX;
        end
        
        % Property setter for setCameraPosY.
        function object = set.setCameraPosY(object, ...
                                            setCameraPosY)
            % Makes sure setCameraPosY is a string before setting.
            assert(ischar(setCameraPosY), ...
                   'Error: setCameraPosY must be a string.');
            object.setCameraPosY = setCameraPosY;
        end
        
        % Property setter for setCameraPosZ.
        function object = set.setCameraPosZ(object, ...
                                            setCameraPosZ)
            % Makes sure setCameraPosZ is a string before setting.
            assert(ischar(setCameraPosZ), ...
                   'Error: setCameraPosZ must be a string.');
            object.setCameraPosZ = setCameraPosZ;
        end
        
        % Property setter for textureFolder.
        function object = set.textureFolder(object, ...
                                            textureFolder)
            % Makes sure textureFolder is a string before setting.
            assert(ischar(textureFolder), ...
                   'Error: textureFolder must be a string.');
            object.textureFolder = textureFolder;
        end
        
        % Property setter for textureIDFloor.
        function object = set.textureIDFloor(object, ...
                                             textureIDFloor)
            % Makes sure textureIDFloor is a string before setting.
            assert(ischar(textureIDFloor), ...
                   'Error: textureIDFloor must be a string.');
            object.textureIDFloor = textureIDFloor;
        end
        
        % Property setter for textureIDWall.
        function object = set.textureIDWall(object, ...
                                            textureIDWall)
            % Makes sure textureIDWall is a string before setting.
            assert(ischar(textureIDWall), ...
                   'Error: textureIDWall must be a string.');
            object.textureIDWall = textureIDWall;
        end
        
        % Property setter for viewingDistance.
        function object = set.viewingDistance(object, ...
                                              viewingDistance)
            % Makes sure viewingDistance is a string before setting.
            assert(ischar(viewingDistance), ...
                   'Error: viewingDistance must be a string.');
            object.viewingDistance = viewingDistance;
        end
        
        % Property setter for wallThickRatio.
        function object = set.wallThickRatio(object, ...
                                             wallThickRatio)
            % Makes sure wallThickRatio is a string before setting.
            assert(ischar(wallThickRatio), ...
                   'Error: wallThickRatio must be a string.');
            object.wallThickRatio = wallThickRatio;
        end
        
        % Property setter for wallThickEyeRatio.
        function object = set.wallThickEyeRatio(object, ...
                                                wallThickEyeRatio)
            % Makes sure wallThickEyeRatio is a string before setting.
            assert(ischar(wallThickEyeRatio), ...
                   'Error: wallThickEyeRatio must be a string.');
            object.wallThickEyeRatio = wallThickEyeRatio;
        end
    end
end