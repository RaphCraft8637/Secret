local funni = -100
local funny = -50
local theFunni = 0
local hpOfs = 200

function onCreatePost()
    setObjectOrder('boyfriendGroup', 100)
    
    noteTweenX('note0x' .. getSongPosition(), 0, -1000, 0.01, "cubeInOut");
    noteTweenX('note1x' .. getSongPosition(), 1, -1000, 0.01, "cubeInOut");
    noteTweenX('note2x' .. getSongPosition(), 2, -1000, 0.01, "cubeInOut");
    noteTweenX('note3x' .. getSongPosition(), 3, -1000, 0.01, "cubeInOut");
    
    noteTweenX('note4x' .. getSongPosition(), 4, 412, 0.01, "cubeInOut");
    noteTweenX('note5x' .. getSongPosition(), 5, 524, 0.01, "cubeInOut");
    noteTweenX('note6x' .. getSongPosition(), 6, 636, 0.01, "cubeInOut");
    noteTweenX('note7x' .. getSongPosition(), 7, 748, 0.01, "cubeInOut");

    theFunni = getProperty('healthBar.x')

    setProperty('healthBar.x', theFunni+hpOfs)

    setProperty('camOther.alpha', 0)
end

function onPause()
    setProperty('camOther.alpha', 1)
end

function onResume()
    setProperty('camOther.alpha', 0)
end

function onUpdate()
    setProperty('boyfriend.x', funni)
    setProperty('boyfriend.y', funny)
    setProperty('boyfriendGroup.x', funni)
    setProperty('boyfriendGroup.y', funny)
    setProperty('boyfriend.scale.x', 0.75)
    setProperty('boyfriend.scale.y', 0.75)
    if yTween == true then
        funny = getProperty('markY.y')
    end
    if xTween == true then
        funni = getProperty('markX.x')
    end
    setObjectCamera('boyfriend', 'HUD')
end

function onEvent(ev, v1, v2)
    if ev == 'markPos' then
        if v2 == 'left' then
            xTween = true
            makeLuaSprite('markX', nil, funni, 12467)
            setObjectCamera('markX', 'hud')
            addLuaSprite('markX', true)
            doTweenX('markX', 'markX', -100, 1.16, 'quadInOut')
            triggerEvent('Change Character', 'BF', 'mark')
            triggerEvent('Alt Idle Animation', 'BF', '-alt')
            doTweenX('healthBar', 'healthBar', theFunni+hpOfs, 1.16, 'quadInOut')
        end
        if v1 == 'up' then
            yTween = true
            makeLuaSprite('markY', nil, 14913, funny)
            setObjectCamera('markY', 'hud')
            addLuaSprite('markY', true)
            doTweenY('markY', 'markY', -50, 1.16, 'quadInOut')
        end
        if v2 == 'right' then
            xTween = true
            makeLuaSprite('markX', nil, funni, 12467)
            setObjectCamera('markX', 'hud')
            addLuaSprite('markX', true)
            doTweenX('markX', 'markX', 800, 1.16, 'quadInOut')
            triggerEvent('Change Character', 'BF', 'markflipped')
            triggerEvent('Alt Idle Animation', 'BF', '')
            doTweenX('healthBar', 'healthBar', theFunni-hpOfs, 1.16, 'quadInOut')
        end
        if v1 == 'down' then
            yTween = true
            makeLuaSprite('markY', nil, 14913, funny)
            setObjectCamera('markY', 'hud')
            addLuaSprite('markY', true)
            doTweenY('markY', 'markY', 375, 1.16, 'quadInOut')
        end
    elseif ev == 'cams' and v1 ~= 'none' then
        doTweenX('healthBar', 'healthBar', theFunni-hpOfs, 1.16, 'quadInOut')
    end
    if ev == 'gameplayShit' and v1 == 'cutscene' then
        setProperty('boyfriend.visible', false)
    end
end

function onTweenCompleted(tween)
    if tween == 'markX' then
        xTween = false
    end
    if tween == 'markY' then
        yTween = false
    end
end