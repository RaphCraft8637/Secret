local var1 = ''
local var2 = ''
local healthtween = false
local save = 0

function onEvent(ev, v1, v2) --v1 = object, duartion --v2 = location, duration 
    var1 = Split(v1,',')
    var2 = Split(v2,',')

    if var1[1] ~= 'health' then
        if var1[2] == 'x' then
            if var2[1] == 'save' then
                doTweenX(var1[1]..'X', var1[1], save, var2[2], var2[3])
            else
                doTweenX(var1[1]..'X', var1[1], var2[1], var2[2], var2[3])
            end
        elseif var1[2] == 'y' then
            if var2[1] == 'save' then
                doTweenY(var1[1]..'Y', var1[1], save, var2[2], var2[3])
            else
                doTweenY(var1[1]..'Y', var1[1], var2[1], var2[2], var2[3])
            end
        elseif var1[2] == 'angle' then
            if var2[1] == 'save' then
                doTweenY(var1[1]..'Angle', var1[1], save, var2[2], var2[3])
            else
                doTweenY(var1[1]..'Angle', var1[1], var2[1], var2[2], var2[3])
            end
        elseif var1[2] == 'scale' then
            if var2[1] == 'save' then
                doTweenX(var1[1]..'ScaleX', var1[1]..'.scale', save, var2[2], var2[3])
                doTweenY(var1[1]..'ScaleY', var1[1]..'.scale', save, var2[2], var2[3])
            else
                doTweenX(var1[1]..'ScaleX', var1[1]..'.scale', var2[1], var2[2], var2[3])
                doTweenY(var1[1]..'ScaleY', var1[1]..'.scale', var2[1], var2[2], var2[3])
            end
        elseif var1[2] == 'alpha' then
            if var2[1] == 'save' then
                doTweenAlpha(var1[1]..'Alpha', var1[1], save, var2[2], var2[3])
            else
                doTweenAlpha(var1[1]..'Alpha', var1[1], var2[1], var2[2], var2[3])
            end
        end
    elseif var1[1] == 'health' then
        healthtween = true
        makeLuaSprite('healthShit', nil, getProperty('health'), 14279908)
        setObjectCamera('healthShit', 'hud')
        addLuaSprite('healthShit', true)
        if v2 == 'save' then
            doTweenX('healthShit', 'healthShit', var2[1], save, var2[3])
        else
            doTweenX('healthShit', 'healthShit', var2[1], var2[2], var2[3])
        end
    elseif v1 == 'save' then
        save = getProperty(v2)
    end
end

function onUpdate()
    if healthtween == true then
        setProperty('health',getProperty('healthShit.x'))
    end
end

function onTweenCompleted(tween)
    if tween == 'healthShit' then
        healthtween = false
    end
end

function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, tostring(match));
    end
    return result;
end