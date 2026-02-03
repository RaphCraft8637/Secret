function onCreatePost()
    makeLuaSprite('warning1', 'other/warning1', 1150, 650)
    addLuaSprite('warning1',true)
    setObjectCamera('warning1','hud')
    setProperty('warning1.visible', false)

    makeLuaSprite('warning2', 'other/warning2', 1150-4, 650-4)
    addLuaSprite('warning2',true)
    setObjectCamera('warning2','hud')
    setProperty('warning2.visible', false)
end

function onBeatHit()
	if curBeat % 1 == 0 and curBeat > 399 and curBeat < 408 then
        if getProperty('warning1.visible') == true then
            setProperty('warning1.visible', false)
        elseif getProperty('warning1.visible') == false then
            setProperty('warning1.visible', true)
        end
	end
    if curBeat == 408 then
        setProperty('warning2.visible', false)
    end
end

function onStepHit()
	if curStep % 2 == 0 and curStep > 1631 and curStep < 1665 then
        setProperty('warning1.visible', false)
        if getProperty('warning2.visible') == true then
            setProperty('warning2.visible', false)
        elseif getProperty('warning2.visible') == false then
            setProperty('warning2.visible', true)
        end
	end
    if curStep == 1665 then
        setProperty('warning2.visible', false)
    end
end