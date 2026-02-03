local beatLength=1
local stepLength=0

local charName='mark'
local charDirectory='characters/mark-office'
local charScale=1
local offsetScalesWithSize=true
local correspondingNoteType='ExtraCharNote1'
local singLength=4

local charPos={100, 350}
local prefixes={
		[1]='left', --[[left]]
		[2]='down', --[[down]]
		[3]='up', --[[up]]
		[4]='right', --[[right]]
		[5]='idle', --[[idle]]
	}
local charOffsets={
		[1]={61, -27}, --[[left]]
		[2]={-10, -90}, --[[down]]
		[3]={-60, 40}, --[[up]]
		[4]={-80, -25}, --[[right]]
		[5]={0, 0}, --[[idle]]
	}

function mathStuffs()
	beatLength=(1/bpm)*60
	stepLength=beatLength*0.25
end

function advAnim(obj,anim,forced,offsetTable)
	playAnim(obj, anim, forced)
	if offsetScalesWithSize then
		setProperty(obj..'.offset.x', offsetTable[1]*charScale)
		setProperty(obj..'.offset.y', offsetTable[2]*charScale)
	else
		setProperty(obj..'.offset.x', offsetTable[1])
		setProperty(obj..'.offset.y', offsetTable[2])		
	end
end

local singAnims={'singLEFT','singDOWN','singUP','singRIGHT'}

function onCreatePost()
	mathStuffs()
	makeAnimatedLuaSprite(charName, charDirectory, charPos[1], charPos[2])

		addAnimationByPrefix(charName, 'singLEFT', prefixes[1], 24, false)
		addAnimationByPrefix(charName, 'singDOWN', prefixes[2], 24, false)
		addAnimationByPrefix(charName, 'singUP', prefixes[3], 24, false)
		addAnimationByPrefix(charName, 'singRIGHT', prefixes[4], 24, false)
		addAnimationByPrefix(charName, 'idle', prefixes[5], 24, false)

	advAnim(charName, 'idle' , true, charOffsets[5])
	setProperty(charName..'.visible', false)
	addLuaSprite(charName, true)
end

function onEvent(ev, v1, v2)
    if ev == 'gameplayShit' and v1 == 'cutscene' then
        setProperty(charName..'.visible', true)
    end
end

function goodNoteHit(id,dir,note,sus)
	--if note==correspondingNoteType then
		advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
		runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	--end
end

--function opponentNoteHit(id,dir,note,sus)
	--if note==correspondingNoteType then
		--advAnim(charName, singAnims[dir+1], true, charOffsets[dir+1])
		--runTimer(charName..'-holdTimer', stepLength*singLength, 1)
	--end
--end

function onTimerCompleted(tag,loops,loopsLeft)
	if tag==charName..'-holdTimer' then
		advAnim(charName, 'idle' , true, charOffsets[5])
	end
end

function onBeatHit()
	if curBeat%2==0 and getProperty(charName..'.animation.curAnim.name')=='idle' then
		advAnim(charName, 'idle' , true, charOffsets[5])
	end
end