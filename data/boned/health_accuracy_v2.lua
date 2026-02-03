-- Script amélioré pour BONED : Santé infinie + 100% accuracy (VERSION ROBUSTE)

local totalNotes = 0
local sickHits = 0

function onUpdatePost(elapsed)
    -- Maintient la santé à 2 (pleine)
    setProperty('health', 2)
    
    -- Force l'accuracy à 100% (plusieurs méthodes)
    setProperty('ratingPercent', 1)
    setProperty('songMisses', 0)
    
    -- Force le rating à être "SFC" (Sick Full Combo)
    setProperty('ratingFC', 'SFC')
    setProperty('ratingName', 'SFC')
    
    -- Calcule un score parfait
    if totalNotes > 0 then
        setProperty('songScore', totalNotes * 350)
    end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    -- Compte toutes les notes comme parfaites
    if not isSustainNote then
        totalNotes = totalNotes + 1
        sickHits = sickHits + 1
    end
    
    -- Force le rating de chaque note à "sick"
    setProperty('rating', 'sick')
end

function noteMiss(id, direction, noteType, isSustainNote)
    -- Empêche complètement les misses d'être enregistrés
    setProperty('songMisses', 0)
    setProperty('health', 2)
end

function noteMissPress(direction)
    -- Empêche les ghost misses
    setProperty('songMisses', 0)
end

function onRecalculateRating()
    -- Force le recalcul du rating à 100%
    setProperty('ratingPercent', 1)
    setProperty('ratingFC', 'SFC')
    return Function_Stop
end
