--change this if you wanna make health drain less crazy overall
globalHealthMult = 0.45
function onCreatePost()
	if difficulty == 0 then
		globalHealthMult = 0.45
	else
		globalHealthMult = 0.6
	end
end

function onEvent(n, v1, v2)

	if v1 == '' then
		v1 = 0
	end
	if v2 == '' then
		v2 = 0
	end
	v1 = v1*globalHealthMult
	v2 = v2*globalHealthMult
	if n == 'Health Drain' then
	    function opponentNoteHit(id,dir,note,sus)
	        if getProperty('health') > 0.2 then
				setProperty('health', getProperty('health') - (v1 + (v2 * getProperty('health'))))
			end
			if getProperty('health') < 0.05 then
				setProperty('health', 0.05)
	        end
        end
	end
end