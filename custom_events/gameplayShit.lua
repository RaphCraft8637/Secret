function onCreatePost()
	precacheImage('other/mask')
	precacheImage('other/cams2')
	precacheImage('cutscene')
end

function onEvent(ev, v1, v2)
    if ev == 'gameplayShit' then
        if v1 == 'cams2' then
            cancelTween('static')

            makeAnimatedLuaSprite('cams2', 'other/cams2', 0, 0)
            setObjectCamera('cams2', 'hud')
            addAnimationByPrefix('cams2', 'camsOn', 'cams camsOn', 18, false)  
            addAnimationByPrefix('cams2', 'static', 'cams static', 18, true)  
            addAnimationByPrefix('cams2', 'camsOff', 'cams camsOff', 18, false)  
            if v2 == 'staticIn' then
                objectPlayAnimation('cams2', 'static', true)
                addLuaSprite('cams2',true)
                setProperty('cams2.alpha', 0.25)
                doTweenAlpha('static', 'cams2', 1, 1.16)
                setObjectOrder('boyfriendGroup', getObjectOrder('cams2')+1)
            elseif v2 == 'staticOut' then
                objectPlayAnimation('cams2', 'static', true)
                addLuaSprite('cams2',true)
                setProperty('cams2.alpha', 1)
                doTweenAlpha('static', 'cams2', 0.25, 1.16)
                setObjectOrder('boyfriendGroup', getObjectOrder('cams2')+1)
            elseif v2 == 'camChange' then
                objectPlayAnimation('cams2', 'static', true)
                addLuaSprite('cams2',true)
                setProperty('cams2.alpha', 1)
                doTweenAlpha('static', 'cams2', 0.25, 0.29)
                setObjectOrder('boyfriendGroup', getObjectOrder('cams2')+1)
            else
                objectPlayAnimation('cams2', v2, true)
                addLuaSprite('cams2',false)
                setProperty('cams2.alpha', 1)
            end
        end
        if v1 == 'mask' then
            makeAnimatedLuaSprite('mask', 'other/mask', 0, 0)
            setObjectCamera('mask', 'hud')
            addAnimationByPrefix('mask', 'maskOn', 'mask maskOn', 18, false)  
            addAnimationByPrefix('mask', 'maskOff', 'mask maskOff', 18, false)  
            addLuaSprite('mask',false)
            objectPlayAnimation('mask', v2, true)
        end
        if v1 == 'cutscene' then
            makeLuaSprite('blackHUD', nil, 0, 0)
            makeGraphic('blackHUD', 1280, 720, '000000')
            addLuaSprite('blackHUD',false)
            setObjectCamera('blackHUD','hud')
            
            makeAnimatedLuaSprite('cutscene', 'cutscene', 0, 0)
            setObjectCamera('cutscene', 'hud')
            addAnimationByPrefix('cutscene', 'cutscene', 'cutscene', 30, false)
            addLuaSprite('cutscene',false)
            objectPlayAnimation('cutscene', v2, true)
        end
        if v1 == 'cutsceneOFF' then
            removeLuaSprite('blackHUD')
            removeLuaSprite('cutscene')
        end
    end
end