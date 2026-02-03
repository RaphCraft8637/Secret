local foxy = 100
local foxyInHallway = false
local batterie = 100
local batGraphic = 5

function onCreatePost()
	makeLuaSprite('foxybg', nil, 1280-12-10, 0) --593
	makeGraphic('foxybg', 12+10, 720, '000000')
	addLuaSprite('foxybg',true)
    setObjectCamera('foxybg','hud')
    
	makeLuaSprite('foxyw', nil, 1280-6-10, 6) --593
	makeGraphic('foxyw', 10, 720-12, 'FFFFFF')
	addLuaSprite('foxyw',true)
    setObjectCamera('foxyw','hud')

    setProperty('foxybg.alpha', 0)
    setProperty('foxyw.alpha', 0)
    
	makeLuaText('foxyText', 'SPACE! ------>', screenWidth, 0, 500)
    setObjectCamera('foxyText', 'hud');
    setTextColor('foxyText', '0xffffff')
    setTextSize('foxyText', 50);
    setTextBorder('foxyText', 2, '000000')
    addLuaText('foxyText');
    
    makeLuaSprite('lightHall', 'lightHall', -850, -250)
    addLuaSprite('lightHall',false)
    scaleObject('lightHall', 1.5, 1.5)
    setObjectOrder('lightHall', getObjectOrder('desk')-1)
    
    makeLuaSprite('batterie', 'other/batterie5', 50, 50)
    addLuaSprite('batterie',false)
    setObjectCamera('batterie', 'hud');

    setProperty('foxyText.alpha', 0)
end

function onEvent(ev, v1, v2)
    if ev == 'foxyMechanic' then
        if v1 == 'start' then
            foxyInHallway = true
            doTweenAlpha('foxybg', 'foxybg', 1, 1, 'circInOut')
            doTweenAlpha('foxyw', 'foxyw', 1, 1, 'circInOut')
            doTweenAlpha('foxyText', 'foxyText', 1, 1, 'circInOut')
            runTimer('foxyText', 5)
        end
        if v1 == 'end' then
            foxyInHallway = false
            doTweenAlpha('foxybg', 'foxybg', 0, 1, 'circInOut')
            doTweenAlpha('foxyw', 'foxyw', 0, 1, 'circInOut')
            doTweenAlpha('foxyText', 'foxyText', 0, 1, 'circInOut')
        end
        if v2 ~= '' then
            makeLuaSprite('hallwayAnim', 'hallway/'..v2, -850, -250)
            addLuaSprite('hallwayAnim',false)
            scaleObject('hallwayAnim', 1.5, 1.5)
            setObjectOrder('hallwayAnim', getProperty('fnaf2office')-1)
        else
            removeLuaSprite('hallwayAnim')
        end
    end
end

function onTimerCompleted(timer)
    if timer == 'foxyText' then
        doTweenAlpha('foxyText', 'foxyText', 0, 1, 'circInOut')
    end
end

local foxyMechanicBotPlay = false

function onStepHit()
    setProperty('lightHall.visible', false)
    setProperty('hallway.visible', false)
    if foxyInHallway == true and getProperty('dad.visible') == true then
        setProperty('dad.visible', false)
    elseif foxyInHallway == false and getProperty('dad.visible') == false then 
        setProperty('dad.visible', true)
    end
end

function onBeatHit()
    if botPlay and foxyInHallway == true then
        foxyMechanicBotPlay = true
        setProperty('dad.visible', true)
        foxy = foxy+5
    end
end

function onUpdate()
    if foxyInHallway == true then
        foxy = foxy-0.2
        if foxy > 100 then
            foxy = 100
        end
	    makeGraphic('foxyw', 10, 708*(foxy/100), 'FFFFFF')
	    setProperty('foxyw.y', 708-708*(foxy/100)+6)
        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
            foxy = foxy+5
        end
        if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SPACE') or botPlay and foxyInHallway == true then
            setProperty('dad.visible', true)
        else
            setProperty('dad.visible', false)
        end
        if getProperty('health') > foxy/50 then
            setProperty('health', foxy/50)
        end
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.pressed.SPACE') and batterie >= 0 or foxyMechanicBotPlay == true and batterie >= 0 then
        setProperty('lightHall.visible', true)
        setProperty('hallway.visible', true)
        batterie = batterie-0.1
        foxyMechanicBotPlay = false
    end
    if batterie < 0 then --19
        batGraphic = 1
    elseif batterie < 20 then --20
        batGraphic = 2
    elseif batterie < 40 then --21
        batGraphic = 3
    elseif batterie < 60 then --20
        batGraphic = 4
    elseif batterie < 80 then --21
        batGraphic = 5
    end
    loadGraphic('batterie', 'other/batterie'..batGraphic)
end