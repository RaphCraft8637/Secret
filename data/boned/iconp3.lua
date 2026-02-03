function onCreatePost()
	makeAnimatedLuaSprite('iconP3', nil, getProperty('iconP2.x'), getProperty('iconP2.y'))
	loadGraphic('iconP3', 'icons/icon-'..getProperty('gf.healthIcon'), 150)
	addAnimation('iconP3', 'icons/icon-'..getProperty('gf.healthIcon'), {0, 1}, 0, true)
	addAnimation('iconP3', 'icons/icon-'..getProperty('gf.healthIcon'), {1, 0}, 0, true)
	addLuaSprite('iconP3', true)
	--setProperty('iconBF.antialiasing', false)
	setObjectOrder('iconP3', getObjectOrder('iconP2') + 1)
	setObjectCamera('iconP3', 'hud')
	setProperty('iconP3.alpha', 0)
end

local side = 'dad'

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'GF Sing' then
		side = 'dad'
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'GF Sing' then
		side = 'bf'
	end
end

function onUpdate()
	loadGraphic('iconP3', 'icons/icon-'..getProperty('gf.healthIcon'), 150)
	addAnimation('iconP3', 'icons/icon-'..getProperty('gf.healthIcon'), {0, 1}, 0, true)
	addAnimation('iconP3', 'icons/icon-'..getProperty('gf.healthIcon'), {1, 0}, 0, true)

local curBFAnim = getProperty('boyfriend.animation.curAnim.name')
local curGFAnim = getProperty('gf.animation.curAnim.name')
local curDadAnim = getProperty('dad.animation.curAnim.name')

	health = getProperty('health')

	if GFsection == true and mustHitSection == true then
		side = 'bf'
	elseif GFsection == true and mustHitSection == false then
		side = 'dad'
	end

	if side == 'dad' then
		setProperty('iconP3.x',getProperty('iconP2.x')-(75*getProperty('iconP2.scale.x')))
		setProperty('iconP3.flipX',false)
		setProperty('iconP3.scale.x', getProperty('iconP2.scale.x'))
		setProperty('iconP3.scale.y', getProperty('iconP2.scale.y'))

		if health > 1.6 then
			setProperty('iconP3.animation.curAnim.curFrame', '0')
		else
			setProperty('iconP3.animation.curAnim.curFrame', '1')
		end
	end
	
	if side == 'bf' then
		setProperty('iconP3.x',getProperty('iconP1.x')+(75*getProperty('iconP1.scale.x')))
		setProperty('iconP3.flipX',true)
		setProperty('iconP3.scale.x', getProperty('iconP1.scale.x'))
		setProperty('iconP3.scale.y', getProperty('iconP1.scale.y'))

		if health < 0.4 then
			setProperty('iconP3.animation.curAnim.curFrame', '0')
		else
			setProperty('iconP3.animation.curAnim.curFrame', '1')
		end
	end

	setProperty('iconP3.y',getProperty('iconP2.y')-25)

    if curGFAnim == 'singLEFT' or curGFAnim == 'singLEFT-alt'then
		if getProperty('iconP3.alpha') < 1 then
			setProperty('iconP3.alpha', getProperty('iconP3.alpha')+0.075)
		end
	elseif curGFAnim == 'singDOWN' or curGFAnim == 'singDOWN-alt' then
		if getProperty('iconP3.alpha') < 1 then
			setProperty('iconP3.alpha', getProperty('iconP3.alpha')+0.075)
		end
	elseif curGFAnim == 'singUP' or curGFAnim == 'singUP-alt' then
		if getProperty('iconP3.alpha') < 1 then
			setProperty('iconP3.alpha', getProperty('iconP3.alpha')+0.075)
		end
	elseif curGFAnim == 'singRIGHT' or curGFAnim == 'singRIGHT-alt' then
		if getProperty('iconP3.alpha') < 1 then
			setProperty('iconP3.alpha', getProperty('iconP3.alpha')+0.075)
		end
	else
		if getProperty('iconP3.alpha') > 0 then
			setProperty('iconP3.alpha', getProperty('iconP3.alpha')-0.005)
		end
	end

	if side == 'dad' and getProperty('iconP3.x') < 0 then
		setProperty('iconP3.x', 0)
	end
	if side == 'bf' and getProperty('iconP3.x') > 1130 then
		setProperty('iconP3.x', 1130)
	end
end