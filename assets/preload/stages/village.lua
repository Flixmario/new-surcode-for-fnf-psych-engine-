function onCreate()

	makeLuaSprite('village', 'village', -865, -467);
    addLuaSprite('village', false);
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