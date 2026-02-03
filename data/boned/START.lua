function onCreatePost()
    makeLuaSprite('blackHUD', nil, 0, 0)
    makeGraphic('blackHUD', 1280, 720, '000000')
    addLuaSprite('blackHUD',true)
    setObjectCamera('blackHUD','hud')
        
    makeLuaSprite('warningStart', 'HEY!', 0, 0)
    addLuaSprite('warningStart',true)
    setObjectCamera('warningStart','hud')

    setObjectOrder('blackHUD', getObjectOrder('boyfriendGroup')+100)
    setObjectOrder('warningStart', getObjectOrder('boyfriendGroup')+101)
end

function onStartCountdown()
    runTimer('ballsStart', 1)
end

function onTimerCompleted(timer)
    if timer == 'ballsStart' then
        removeLuaSprite('blackHUD')
        removeLuaSprite('warningStart')
    end
end