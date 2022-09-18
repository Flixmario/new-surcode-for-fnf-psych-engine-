function onCreate()

	makeLuaSprite('beach', 'beach', -778, -500);
    addLuaSprite('beach', false);
	
makeAnimatedLuaSprite('pibby','pibby',1250,430)
addAnimationByPrefix('pibby','bounce','pibby Idle',13,true)
addLuaSprite('pibby',true)

end

function opponentNoteHit()
   local luckyRoll = math.random(1, 50)
    local luckyRoll2 = math.random(1, 50)
    
    if mustHitSection == false then
        if (luckyRoll >= 45) then
            cameraShake('hud', 0.09, 0.05);
      end
   end
 end