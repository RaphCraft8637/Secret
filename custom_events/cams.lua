local mapOfs = 125
local hpx = 0

function onCreatePost()
    makeLuaSprite('fnaf2', 'cams/2fnaf', 931-mapOfs, 502-mapOfs)
    addLuaSprite('fnaf2',true)
    setObjectCamera('fnaf2','hud')
    setProperty('fnaf2.visible', false)

    for cam = 1,12 do
        makeLuaSprite('2cam'..cam..'real', 'cams/2cam'..cam..'real', 0, 0)
        addLuaSprite('2cam'..cam..'real',false)
        setObjectCamera('2cam'..cam..'real','hud')
        setProperty('2cam'..cam..'real.visible', false)

        makeLuaSprite('2cam'..cam, 'cams/2cam'..cam, 0, 0)
        addLuaSprite('2cam'..cam,true)
        setObjectCamera('2cam'..cam,'hud')
        setProperty('2cam'..cam..'.visible', false)

        makeLuaSprite('2cam'..cam..'on', 'cams/2cam'..cam..'w', 0, 0)
        addLuaSprite('2cam'..cam..'on',true)
        setObjectCamera('2cam'..cam..'on','hud')
        setProperty('2cam'..cam..'on.visible', false)
    end

    for funniCams = 1,6 do
        scaleObject('2cam'..funniCams..'real', 1.25, 1)
    end

    setProperty('2cam1.x', 946-mapOfs)
    setProperty('2cam1.y', 688-mapOfs)

    setProperty('2cam2.x', 1101-mapOfs)
    setProperty('2cam2.y', 688-mapOfs)

    setProperty('2cam3.x', 946-mapOfs)
    setProperty('2cam3.y', 628-mapOfs)

    setProperty('2cam4.x', 1101-mapOfs)
    setProperty('2cam4.y', 628-mapOfs)

    setProperty('2cam5.x', 946-mapOfs)
    setProperty('2cam5.y', 774-mapOfs)

    setProperty('2cam6.x', 1101-mapOfs)
    setProperty('2cam6.y', 774-mapOfs)

    setProperty('2cam7.x', 1115-mapOfs)
    setProperty('2cam7.y', 548-mapOfs)

    setProperty('2cam8.x', 966-mapOfs)
    setProperty('2cam8.y', 543-mapOfs)

    setProperty('2cam9.x', 1235-mapOfs)
    setProperty('2cam9.y', 518-mapOfs)

    setProperty('2cam10.x', 1180-mapOfs)
    setProperty('2cam10.y', 613-mapOfs)

    setProperty('2cam11.x', 1307-mapOfs)
    setProperty('2cam11.y', 568-mapOfs)

    setProperty('2cam12.x', 1257-mapOfs)
    setProperty('2cam12.y', 708-mapOfs)
    
    for funni = 1,12 do
        setProperty('2cam'..funni..'on.x', getProperty('2cam'..funni..'.x'))
        setProperty('2cam'..funni..'on.y', getProperty('2cam'..funni..'.y'))
    end

    hpx = getProperty('healthBar.x')
end

local previous = 'cam1'

function onEvent(ev, v1, v2)
    if ev == 'cams' then
        if v1 == 'fnaf2' then
            setProperty('fnaf2.visible', true)
            for cam = 1,12 do
                setProperty('2cam'..cam..'.visible', true)
            end
            setProperty('2'..previous..'on.visible', false)
            setProperty('2'..v2..'on.visible', true)
            setProperty('2'..previous..'real.visible', false)
            setProperty('2'..v2..'real.visible', true)
            previous = v2
        elseif v1 == 'none' then
            setProperty('fnaf2.visible', false)
            for cam = 1,12 do
                setProperty('2cam'..cam..'.visible', false)
                setProperty('2cam'..cam..'on.visible', false)
                setProperty('2cam'..cam..'real.visible', false)
            end
        end
    end
end