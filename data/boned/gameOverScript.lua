function onCreate()
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'none')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'none')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'none')
end

local mangle = false

function onGameOverStart()
    setProperty('camOther.alpha', 1)
	makeLuaSprite('blackHUD', nil, 0, 0)
	makeGraphic('blackHUD', 1280, 720, '000000')
	addLuaSprite('blackHUD',false)
	setObjectCamera('blackHUD','other')
	if dadName == 'bb-vent' or dadName == 'bb-office' then
		startVideo('bb')
		runTimer('restart', 19)
	elseif gfName == 'mangle' and mangle == true then
		startVideo('mangle')
		runTimer('restart', 4)
	elseif dadName == 'puppet' then
		startVideo('puppet')
		runTimer('restart', 6)
	elseif dadName == 'sb' or gfName == 'sf' or dadName == 'sb-office' or gfName == 'sf-office' then
		runTimer('close', 1)
	elseif dadName == 'toyBonnie' then
		startVideo('tbonnie')
		runTimer('restart', 9)
	elseif dadName == 'toyChica' and mangle == false then
		startVideo('tchica')
		runTimer('restart', 6)
	elseif dadName == 'wbonnie' then
		startVideo('wbonnie')
		runTimer('restart', 5)
	elseif dadName == 'wchica' then
		startVideo('wchica')
		runTimer('restart', 6)
	elseif dadName == 'wfoxy' then
		startVideo('wfoxy')
		runTimer('restart', 7)
	elseif dadName == 'wfreddy' then
		startVideo('wfreddy')
		runTimer('restart', 7)
	elseif dadName == 'wgolden' then
		startVideo('wgolden')
		runTimer('restart', 6)
	elseif dadName == 'toyFreddy' then
		makeLuaSprite('noFreddy', 'noFreddy', 0, 0)
		setObjectCamera('noFreddy','other')
		addLuaSprite('noFreddy', true)
		runTimer('restart', 1)
		setObjectOrder('noFreddy', getObjectOrder('blackHUD')+1)
	end
end

function onTimerCompleted(timer)
	if timer == 'restart' then
		restartSong()
	end
	if timer == 'close' then
		os.exit()
	end
end

function opponentNoteHit(id,dir,notetype,sus)
	if notetype == 'GF Sing' and gfName == 'mangle' then
		mangle = true
	else
		mangle = false
	end
end

function onGameOverConfirm()
	cancelTimer('restartTheFreakingSong')
	cancelTimer('closeTheFUCKINGGame')
end