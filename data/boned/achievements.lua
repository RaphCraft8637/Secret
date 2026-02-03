local missesSection = 0
local misses = 0
local chicaMisses = 0
local achievement = {'toyb','mangle','toyc','toyf','puppet','wbonnie','ourple','balloon','wfoxy','wchica','wfreddy','wgolden','6am','sb','sf','bs','nomisses','boned','toybd','mangled','toycd','toyfd','puppetd','wbonnied','ourpled','balloond','wfoxyd','wchicad','wfreddyd','wgoldend','close','lastmiss'}
local balls = 0
local mangle = false

function opponentNoteHit(id,dir,notetype,sus)
	if notetype == 'GF Sing' and gfName == 'mangle' then
		mangle = true
	else
		mangle = false
	end
end

function onBeatHit()
if not botPlay then
    if curBeat == 192 then
        SectionAchievement(achievement[1])
        missesSection = 0
        chicaMisses = 0
    end
    if curBeat == 256 then
        chicaMisses = missesSection
        missesSection = 0
    end
    if curBeat == 320 then
        SectionAchievement(achievement[2])
        missesSection = chicaMisses
    end
    if curBeat == 352 then
        SectionAchievement(achievement[3])
        missesSection = 0
    end
    if curBeat == 416 then
        SectionAchievement(achievement[4])
        missesSection = 0
    end
    if curBeat == 544 then
        SectionAchievement(achievement[5])
        missesSection = 0
    end
    if curBeat == 672 then
        SectionAchievement(achievement[6])
        missesSection = 0
    end
    if curBeat == 816 then
        SectionAchievement(achievement[7])
        missesSection = 0
    end
    if curBeat == 946 then
        SectionAchievement(achievement[8])
        missesSection = 0
    end
    if curBeat == 1088 then
        SectionAchievement(achievement[9])
        missesSection = 0
    end
    if curBeat == 1148 then
        SectionAchievement(achievement[10])
        missesSection = 0
    end
    if curBeat == 1284 then
        SectionAchievement(achievement[11])
        missesSection = 0
    end
    if curBeat == 1412 then
        SectionAchievement(achievement[12])
        missesSection = 0
        if not isAchievementUnlocked(achievement[13]) then
            unlockAchievement(achievement[13])
        end
    end
    if curBeat == 1626 then
        SectionAchievement(achievement[14])
        missesSection = 0
    end
    if curBeat == 1670 then
        SectionAchievement(achievement[15])
        missesSection = 0
    end
    if curBeat == 1711 then
        SectionAchievement(achievement[16])
        missesSection = 0
    end
end
checkAchievements()
end

function noteMiss(id, direction, noteType, isSustainNote)
    missesSection = missesSection+1
    misses = misses+1
    chicaMisses = chicaMisses+1
    if curBeat == 1710 and not isAchievementUnlocked(achievement[32]) then
        unlockAchievement(achievement[32])
    end
end

function SectionAchievement(char)
if not botPlay then
    if missesSection == 0 and not isAchievementUnlocked(char) then
        unlockAchievement(char)
    end
    missesSection = 0
end
end

function onCreatePost()
    setAchievementScore('all', 0, true)
    balls = 0
end

function onEndSong()
if not botPlay then
    if not isAchievementUnlocked(achievement[17]) and misses == 0 then
        unlockAchievement(achievement[17])
    end
    if rating >= 0.9 and not isAchievementUnlocked(achievement[18]) then
        unlockAchievement(achievement[18])
    end
end
checkAchievements()
end

function checkAchievements()
    balls = 0
    for i = 1,#achievement do
        if isAchievementUnlocked(achievement[i]) then
            balls = balls+1
        end
    end
    setAchievementScore('all', balls, true)
    --getAchievementScore('all')
    --debugPrint("Achievements are all counted"); 
    --debugPrint(rating); 
    if balls == #achievement then
        unlockAchievement('all')
    end
end

function onGameOverStart()
	if dadName == 'bb-vent' or dadName == 'bb-office' and not isAchievementUnlocked(achievement[26]) then
        unlockAchievement(achievement[26])
	elseif gfName == 'mangle' and mangle == true and not isAchievementUnlocked(achievement[20]) then
        unlockAchievement(achievement[20])
	elseif dadName == 'puppet' and not isAchievementUnlocked(achievement[23]) then
        unlockAchievement(achievement[23])
	elseif dadName == 'sb' and not isAchievementUnlocked(achievement[31]) or gfName == 'sf' and not isAchievementUnlocked(achievement[31]) or dadName == 'sb-office' and not isAchievementUnlocked(achievement[31]) or gfName == 'sf-office' and not isAchievementUnlocked(achievement[31]) then
        unlockAchievement(achievement[31])
	elseif dadName == 'toyBonnie' and not isAchievementUnlocked(achievement[19]) then
        unlockAchievement(achievement[19])
	elseif dadName == 'toyChica' and mangle == false and not isAchievementUnlocked(achievement[21]) then
        unlockAchievement(achievement[21])
	elseif dadName == 'wbonnie' and not isAchievementUnlocked(achievement[24]) then
        unlockAchievement(achievement[24])
	elseif dadName == 'wchica' and not isAchievementUnlocked(achievement[28]) then
        unlockAchievement(achievement[28])
	elseif dadName == 'wfoxy' and not isAchievementUnlocked(achievement[27]) then
        unlockAchievement(achievement[27])
	elseif dadName == 'wfreddy' and not isAchievementUnlocked(achievement[29]) then
        unlockAchievement(achievement[39])
	elseif dadName == 'wgolden' and not isAchievementUnlocked(achievement[30]) then
        unlockAchievement(achievement[30])
	elseif dadName == 'toyFreddy' and not isAchievementUnlocked(achievement[22]) then
        unlockAchievement(achievement[22])
	elseif dadName == 'ourple' and not isAchievementUnlocked(achievement[25]) then
        unlockAchievement(achievement[25])
	end
end