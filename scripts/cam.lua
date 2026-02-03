local time = 1
local bfCam = {0,0}
local dadCam = {0,0}
local bfOfs = {0,0,0}
local dadOfs = {0,0,0}
local bfCAMofs = {0,0}
local dadCAMofs = {0,0}
local ofsBF = {-100,-100}
local ofsDAD = {150,-100}
local forcedPosition = false
local forcedPositionXY = {0,0}

function followNote(direction, note_type, sustained, char)
    if note_type ~= 'No Animation' then
        if not sustained then
            if char == 'bf' then
                runTimer('resetbf', 1)
                if direction == 0 then
                    bfOfs = {-20,0,3}
                elseif direction == 1 then
                    bfOfs = {0,20,0}
                elseif direction == 2 then
                    bfOfs = {0,-20,0}
                elseif direction == 3 then
                    bfOfs = {20,0,-3}
                end
            elseif char == 'dad' then
                runTimer('resetdad', 1)
                if direction == 0 then
                    dadOfs = {-20,0,3}
                elseif direction == 1 then
                    dadOfs = {0,20,0}
                elseif direction == 2 then
                    dadOfs = {0,-20,0}
                elseif direction == 3 then
                    dadOfs = {20,0,-3}
                end
            end
        else
            if char == 'bf' then
                runTimer('resetbf', 1)
                if direction == 0 then
                    bfOfs = {-10,0,1}
                elseif direction == 1 then
                    bfOfs = {0,10,0}
                elseif direction == 2 then
                    bfOfs = {0,-10,0}
                elseif direction == 3 then
                    bfOfs = {10,0,-1}
                end
            elseif char == 'dad' then
                runTimer('resetdad', 1)
                if direction == 0 then
                    dadOfs = {-10,0,1}
                elseif direction == 1 then
                    dadOfs = {0,10,0}
                elseif direction == 2 then
                    dadOfs = {0,-10,0}
                elseif direction == 3 then
                    dadOfs = {10,0,-1}
                end
            end
        end
    end
end

function onCountdownTick(swagCounter)
    if songName == 'Shop' then
        --do nothing :)
    else
        if swagCounter == 0 then
            bfCam = getProperty('boyfriend.cameraPosition')
            dadCam = getProperty('dad.cameraPosition')
            bfCAMofs = getProperty('boyfriendCameraOffset')
            dadCAMofs = getProperty('opponentCameraOffset')
        end
    end
end

function onUpdate()
    if songName == 'Shop' then
        --do nothing :)
    else
        --doTweenAngle('camHUDangle', 'camHUD', getProperty('camGame.angle'), time/2)
        if mustHitSection == true and not forcedPosition then
            setProperty('camFollow.x', getMidpointX('boyfriend') + bfCam[1] + bfOfs[1] + dadOfs[1] + ofsBF[1] + bfCAMofs[1])
            setProperty('camFollow.y', getMidpointY('boyfriend') + bfCam[2] + bfOfs[2] + dadOfs[2] + ofsBF[2] + bfCAMofs[2])
            --doTweenAngle('game', 'camGame', bfOfs[3] + dadOfs[3], time, 'quadOut')
        elseif mustHitSection == false and not forcedPosition then
            setProperty('camFollow.x', getMidpointX('dad') + dadCam[1] + bfOfs[1] + dadOfs[1] + ofsDAD[1] + dadCAMofs[1])
            setProperty('camFollow.y', getMidpointY('dad') + dadCam[2] + bfOfs[2] + dadOfs[2] + ofsDAD[2] + dadCAMofs[2])
            --doTweenAngle('game', 'camGame', bfOfs[3] + dadOfs[3], time, 'quadOut')
        elseif forcedPosition == true then
            setProperty('camFollow.x', forcedPositionXY[1] + bfOfs[1] + dadOfs[1])
            setProperty('camFollow.y', forcedPositionXY[2] + bfOfs[2] + dadOfs[2])
            --doTweenAngle('game', 'camGame', bfOfs[3] + dadOfs[3], time, 'quadOut')
        end
    end
end

function onUpdatePost()
    if songName == 'Shop' then
        --do nothing :)
        triggerEvent('Camera Follow Pos','','')
    end
end

function onEvent(ev,v1,v2)
    if songName == 'Shop' then
        --do nothing :)
    else
        if ev == 'Change Character' then
            if v1 == 'bf' or v1 == 0 then
                bfCam = getProperty('boyfriend.cameraPosition')
                bfCAMofs = getProperty('boyfriendCameraOffset')
            elseif v1 == 'dad' or v1 == 1 then
                dadCam = getProperty('dad.cameraPosition')
                dadCAMofs = getProperty('opponentCameraOffset')
            end
        end
        if ev == 'Camera Offsets' then
            if v1 == 'bf' then
                ofsBF = Split(v2, ',')
            elseif v1 == 'dad' then
                ofsDAD = Split(v2, ',')
            end
        end
        if ev == 'Camera Follow Pos' then
            if v1 ~= '' or v2 ~= '' then
                forcedPosition = true
                if v1 ~= '' then
                    forcedPositionXY[1] = v1
                end
                if v2 ~= '' then
                    forcedPositionXY[2] = v2
                end
            else
                forcedPosition = false
            end
        end
    end
end

function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, tostring(match));
    end
    return result;
end

function onTimerCompleted(tag)
    if songName == 'Shop' then
        --do nothing :)
    else
        if tag == 'resetbf' then
            bfOfs = {0,0,0}
        end
    
        if tag == 'resetdad' then
            dadOfs = {0,0,0}
        end
    end
end

function goodNoteHit(id, direction, note_type, sustained)
    if songName == 'Shop' then
        --do nothing :)
    else
        followNote(direction, note_type, sustained, 'bf')
    end
end

function opponentNoteHit(id, direction, note_type, sustained)
    if songName == 'Shop' then
        --do nothing :)
    else
        followNote(direction, note_type, sustained, 'dad')
    end
end