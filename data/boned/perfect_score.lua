-- Script ULTIME pour BONED : Score parfait même en ratant
-- Santé infinie + 100% accuracy + Score qui monte TOUJOURS

local fakeScore = 0
local fakeNotes = 0

function onCreate()
    -- Initialise les compteurs
    fakeScore = 0
    fakeNotes = 0
end

function onUpdatePost(elapsed)
    -- Maintient la santé à 2 (pleine)
    setProperty('health', 2)
    
    -- Force tous les paramètres à être parfaits
    setProperty('ratingPercent', 1) -- 100%
    setProperty('songMisses', 0)
    setProperty('songScore', fakeScore)
    setProperty('ratingFC', 'SFC')
    setProperty('ratingName', 'SFC')
    
    -- Force les stats affichées
    setProperty('songHits', fakeNotes)
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    -- Quand tu touches une note, augmente le score
    if not isSustainNote then
        fakeNotes = fakeNotes + 1
        fakeScore = fakeScore + 350 -- Score d'un "Sick"
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    -- MÊME QUAND TU RATES, augmente le score !
    if not isSustainNote then
        fakeNotes = fakeNotes + 1
        fakeScore = fakeScore + 350 -- Comme si c'était un hit parfait
    end
    
    -- Reset les misses
    setProperty('songMisses', 0)
    setProperty('health', 2)
end

function noteMissPress(direction)
    -- Empêche les ghost misses d'affecter le score
    setProperty('songMisses', 0)
end

function onRecalculateRating()
    -- Bloque le recalcul automatique du rating
    setProperty('ratingPercent', 1)
    setProperty('ratingFC', 'SFC')
    return Function_Stop
end

-- Force les notes à toujours compter comme "Sick"
function onEvent(name, value1, value2)
    if name == 'Note Rating' then
        return Function_Stop
    end
end
