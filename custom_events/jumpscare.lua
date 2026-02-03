local creepFactor = 0

function onEventPushed(ev, v1, v2)
    if ev == 'jumpscare' then
        precacheImage('jumpscares/bb')
        precacheImage('jumpscares/bothShadows')
        precacheImage('jumpscares/creep1')
        precacheImage('jumpscares/creep2')
        precacheImage('jumpscares/creep3')
        precacheImage('jumpscares/creep4')
        precacheImage('jumpscares/creep5')
        precacheImage('jumpscares/creep6')
        precacheImage('jumpscares/creep7')
        precacheImage('jumpscares/creep8')
        precacheImage('jumpscares/creep9')
        precacheImage('jumpscares/creep10')
        precacheImage('jumpscares/creep11')
        precacheImage('jumpscares/creep12')
        precacheImage('jumpscares/creep13')
        precacheImage('jumpscares/creep14')
        precacheImage('jumpscares/creep15')
        precacheImage('jumpscares/mangle')
        precacheImage('jumpscares/puppet')
        precacheImage('jumpscares/shadowBonnie')
        precacheImage('jumpscares/shadowFreddy')
        precacheImage('jumpscares/toybonnie')
        precacheImage('jumpscares/wbonnie')
        precacheImage('jumpscares/wfoxy')
        precacheImage('jumpscares/wgolden')
    end
end

function onEvent(ev, v1, v2)
    if ev == 'jumpscare' then
        if v1 ~= 'stop' then
            cancelTween('jumpscare')
            if v1 ~= 'bb' then
                makeLuaSprite('blackHUD', nil, 0, 0)
                makeGraphic('blackHUD', 1280, 720, '000000')
                addLuaSprite('blackHUD',false)
                setObjectCamera('blackHUD','hud')
            end

            makeAnimatedLuaSprite('jumpscare', 'jumpscares/'..v1, 390, 172)
            setObjectCamera('jumpscare', 'hud')
            
            if v1 == 'bb' then
                addAnimationByPrefix('jumpscare', 'jumpscare', v1, 24, true)  
                setProperty('jumpscare.x', getRandomInt(0,1280-720)) --280
                setProperty('jumpscare.y', 0)
            elseif v1 == 'wgolden' then
                setProperty('jumpscare.x', 320)
                setProperty('jumpscare.y', 120)
                addAnimationByPrefix('jumpscare', 'jumpscare', v1, 24, false)  
            else
                addAnimationByPrefix('jumpscare', 'jumpscare', v1, 24, false)  
            end

            objectPlayAnimation('jumpscare', 'jumpscare', true)
            addLuaSprite('jumpscare', true)
            setProperty('jumpscare.scale.x', 2)
            setProperty('jumpscare.scale.y', 2)
            if v2 ~= '' then
                doTweenAlpha('blackHUD', 'blackHUD', 0, v2/2)
                doTweenAlpha('jumpscare', 'jumpscare', 0, v2)
            end
            if v1 == 'creep' then
                removeLuaSprite('jumpscare')
                addLuaSprite('blackHUD',true)
                creepFactor = getRandomInt(1,15)
                makeLuaSprite('creep', 'jumpscares/creep'..creepFactor, 0, 0)
                addLuaSprite('creep',true)
                setObjectCamera('creep','hud')
                if creepFactor == 12 then
                    setProperty('creep.x', getRandomInt(0,1095))
                    setProperty('creep.y',getRandomInt(0,701))
                end
                if creepFactor == 13 then
                    setProperty('creep.x', getRandomInt(0,1237))
                    setProperty('creep.y',getRandomInt(0,707))
                end
                if creepFactor == 14 then
                    setProperty('creep.x', getRandomInt(0,1140))
                    setProperty('creep.y',getRandomInt(0,697))
                end
                if creepFactor == 15 then
                    setProperty('creep.x', getRandomInt(0,684))
                    setProperty('creep.y',getRandomInt(0,632))
                end
            end
        else
            removeLuaSprite('blackHUD')
            removeLuaSprite('jumpscare')
            removeLuaSprite('creep')
        end
    end
end