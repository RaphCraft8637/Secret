local char1 = ''
local char2 = ''

function onEvent(ev, v1, v2)
	if ev == 'Force Sing Opp' then
		char1 = v1
		char2 = v2
	end
end

local singAnims = {"singLEFT", "singDOWN", "singUP", "singRIGHT"}

function opponentNoteHit(id, direction, noteType, isSustainNote)
	if char1 ~= '' then
		if noteType == 'Alt Animation' then
			characterPlayAnim(char1, singAnims[direction + 1]..'-alt', true);
		else
			characterPlayAnim(char1, singAnims[direction + 1], true);
		end
	end
	if char2 ~= '' then
		if noteType == 'Alt Animation' then
			characterPlayAnim(char2, singAnims[direction + 1]..'-alt', true);
		else
			characterPlayAnim(char2, singAnims[direction + 1], true);
		end
	end
end