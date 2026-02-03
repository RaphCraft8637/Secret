local dadColorArray = ''
local dadCOLOR = ''
local bfColorArray = ''
local bfCOLOR = ''
local gfColorArray = ''
local gfCOLOR = ''
local healthMult = 1

function onCreatePost()
	makeLuaSprite('currentHP', nil, 1, 1987) --593
	makeGraphic('currentHP', getProperty('healthBar.width'), getProperty('healthBar.height'), bfCOLOR)
	addLuaSprite('currentHP',true)
    setObjectCamera('currentHP','hud')
	
	makeLuaSprite('hpBG', nil, getProperty('healthBar.x')-6, getProperty('healthBar.y')-6) --593
	makeGraphic('hpBG', getProperty('healthBar.width')+12, getProperty('healthBar.height')+12, '000000')
	addLuaSprite('hpBG',true)
    setObjectCamera('hpBG','hud')
	setObjectOrder('hpBG', 100)

	makeLuaSprite('bfShit', nil, getProperty('healthBar.x'), getProperty('healthBar.y')) --593
	makeGraphic('bfShit', getProperty('healthBar.width'), getProperty('healthBar.height'), bfCOLOR)
	addLuaSprite('bfShit',true)
    setObjectCamera('bfShit','hud')
	setObjectOrder('bfShit', getObjectOrder('bfShit') + 1)
	
	makeLuaSprite('gfShitPlayer', nil, getProperty('healthBar.x'), getProperty('healthBar.y'))
	makeGraphic('gfShitPlayer', getProperty('healthBar.width'), getProperty('healthBar.height')/2, gfCOLOR)
	addLuaSprite('gfShitPlayer',true)
    setObjectCamera('gfShitPlayer','hud')
	setObjectOrder('gfShitPlayer', getObjectOrder('bfShit') + 1)
	setProperty('gfShitPlayer.alpha', 0)

	makeLuaSprite('dadShit', nil, getProperty('healthBar.x'), getProperty('healthBar.y'))
	makeGraphic('dadShit', getProperty('healthBar.width'), getProperty('healthBar.height'), dadCOLOR)
	addLuaSprite('dadShit',true)
    setObjectCamera('dadShit','hud')
	setObjectOrder('dadShit', getObjectOrder('gfShitPlayer') + 1)
	
	makeLuaSprite('gfShit', nil, getProperty('healthBar.x'), getProperty('healthBar.y'))
	makeGraphic('gfShit', getProperty('healthBar.width'), getProperty('healthBar.height')/2, gfCOLOR)
	addLuaSprite('gfShit',true)
    setObjectCamera('gfShit','hud')
	setObjectOrder('gfShit', getObjectOrder('dadShit') + 1)
	setProperty('gfShit.alpha', 0)

	setObjectOrder('iconP1', getObjectOrder('gfShit') + 1)
	setObjectOrder('iconP2', getObjectOrder('iconP1') + 1)
end

function onUpdate()
	if getProperty('health') > 1.99 then
		doTweenX('currentHPx', 'currentHP', 1.99, 0.05)
	else
		doTweenX('currentHPx', 'currentHP', getProperty('health'), 0.05)
	end

	healthMult = getProperty('currentHP.x')/2

	makeGraphic('dadShit', getProperty('healthBar.width')-getProperty('healthBar.width')*healthMult, getProperty('healthBar.height'), dadCOLOR)
	makeGraphic('gfShit', getProperty('healthBar.width')-getProperty('healthBar.width')*healthMult, getProperty('healthBar.height')/2, gfCOLOR)

	makeGraphic('bfShit', getProperty('healthBar.width'), getProperty('healthBar.height'), bfCOLOR)
	makeGraphic('gfShitPlayer', getProperty('healthBar.width'), getProperty('healthBar.height')/2, gfCOLOR)

	dadColorArray = getProperty("dad.healthColorArray")
	dadCOLOR = rgbToHex(dadColorArray[1], dadColorArray[2], dadColorArray[3])
	bfColorArray = getProperty("boyfriend.healthColorArray")
	bfCOLOR = rgbToHex(bfColorArray[1], bfColorArray[2], bfColorArray[3])
	gfColorArray = getProperty("gf.healthColorArray")
	gfCOLOR = rgbToHex(gfColorArray[1], gfColorArray[2], gfColorArray[3])

	setProperty('healthBar.visible', false)
	
	setProperty('bfShit.x', getProperty('healthBar.x'))
	setProperty('bfShit.y', getProperty('healthBar.y'))
	setProperty('gfShit.x', getProperty('bfShit.x'))
	setProperty('gfShit.y', getProperty('bfShit.y'))
	setProperty('gfShitPlayer.x', getProperty('bfShit.x'))
	setProperty('gfShitPlayer.y', getProperty('bfShit.y'))
	setProperty('dadShit.x', getProperty('bfShit.x'))
	setProperty('dadShit.y', getProperty('bfShit.y'))
	setProperty('hpBG.x', getProperty('dadShit.x')-6)
	setProperty('hpBG.y', getProperty('dadShit.y')-6)

	if gfSing == 0 then
		doTweenAlpha('gfShitPlayer', 'gfShitPlayer', 1, 1)
		doTweenAlpha('gfShit', 'gfShit', 0, 1)
	elseif gfSing == 1 then
		doTweenAlpha('gfShitPlayer', 'gfShitPlayer', 0, 1)
		doTweenAlpha('gfShit', 'gfShit', 1, 1)
	elseif gfSing == 2 then
		doTweenAlpha('gfShitPlayer', 'gfShitPlayer', 0, 1)
		doTweenAlpha('gfShit', 'gfShit', 0, 1)
	end
end

local balls1 = 0
local balls2 = 0
local WINDTHESHIT = false
local resetWIND = false

function onEvent(ev,v1,v2)
    if ev == 'foxyMechanic' then
        if v1 == 'musicBox' then
            if v2 == 'true' then
				WINDTHESHIT = true
				balls1 = getProperty('iconP1.x')
				balls2 = getProperty('iconP2.x')
				resetWIND = getProperty('currentHP.x')
			elseif v2 == 'false' then
				WINDTHESHIT = false
				cancelTween('currentHPx')
				setProperty('currentHP.x', resetWIND)
            end
        end
    end
end

function onUpdatePost()
	if getProperty('iconP1.x') > 1130 then
		setProperty('iconP1.x', 1130)
	else
		setProperty('iconP1.x', getProperty('healthBar.width')-getProperty('healthBar.width')*healthMult+getProperty('healthBar.x'))
	end
	if getProperty('iconP2.x') < 0 then
		setProperty('iconP2.x', 0)
	else
		setProperty('iconP2.x', getProperty('healthBar.width')-getProperty('healthBar.width')*healthMult+getProperty('healthBar.x')-150)
	end
	if WINDTHESHIT == true then
		setProperty('iconP1.x', balls1)
		setProperty('iconP2.x', balls2)
	end
end

function opponentNoteHit(id, direction, note_type, sustained)
	if gfSection then
		if mustHitSection then
			gfSing = 0
			runTimer('gfbitch', 1)
		else
			gfSing = 1
			runTimer('gfbitch', 1)
		end
	end

	if note_type == 'GF Sing' then
		gfSing = 1
		runTimer('gfbitch', 1)
	end
end

function goodNoteHit(id, direction, note_type, sustained)
	if gfSection then
		if mustHitSection then
			gfSing = 0
			runTimer('gfbitch', 1)
		else
			gfSing = 1
			runTimer('gfbitch', 1)
		end
	end
	
	if note_type == 'GF Sing' then
		gfSing = 0
		runTimer('gfbitch', 1)
	end
end

function noteMiss(id, direction, note_type, sustained)
	if gfSection then
		if mustHitSection then
			gfSing = 0
		else
			gfSing = 1
		end
	end
	
	if note_type == 'GF Sing' then
		gfSing = 0
		runTimer('gfbitch', 1)
	end
end

function onTimerCompleted(timer)
	if timer == 'gfbitch' then
		gfSing = 2
	end
end

function rgbToHex(r, g, b) -- script from HELD der ZEIT, thanks your really cool man
    --%02x: 0 means replace " "s with "0"s, 2 is width, x means hex
    return string.format("%02x%02x%02x",
        math.floor(r),
        math.floor(g),
        math.floor(b))
end