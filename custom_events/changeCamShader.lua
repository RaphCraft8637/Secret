local shaders = {'beatShader', 'bgGlitch', 'bnw', 'chrom', 'flip', 'glitch', 'heatShader', 'invert', 'mirror', 'pixel1', 'pixel2', 'pixel3', 'rainbow'}
local cams = {'camHUD', 'camGame', 'camOther'}
local time = 0

function onEvent(n, v1, v2)
    if n == "changeCamShader" then
        if v2 == 'none' then
            runHaxeCode([[
                game.]].. v1 ..[[.setFilters([]);
            ]])
        else
            --shaderCoordFix()

            makeLuaSprite(cams[1])
            makeLuaSprite(cams[2])
            makeLuaSprite(cams[3])

            if v2 == 'pixel1' then
                setSpriteShader(v1, 'pixel'..math.random(1,3))
            else
                setSpriteShader(v1, shaders[getRandomInt(1,#shaders)])
            end

            runHaxeCode([[
                game.initLuaShader(game.getLuaObject(']].. v1 ..[[').shader);

                game.]].. v1 ..[[.setFilters([new ShaderFilter(game.getLuaObject(']].. v1 ..[[').shader)]);
            ]])
        end
    end
end

function onCreate()
    --shaderCoordFix()
    for i=1, #shaders do
        initLuaShader(shaders[i])
    end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData3 = spr.__cacheBitmapData2 = spr.__cacheBitmapData = null;
            spr.__cacheBitmapColorTransform = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
    ]])
    
    local temp = onDestroy
    function onDestroy()
        runHaxeCode([[
            FlxG.signals.gameResized.remove(fixShaderCoordFix);
        ]])
        temp()
    end
end

function onUpdatePost(elapsed)
    time = time + elapsed
    for i=1, #cams do
        setShaderFloat(cams[i], 'iTime', time)
    end
end