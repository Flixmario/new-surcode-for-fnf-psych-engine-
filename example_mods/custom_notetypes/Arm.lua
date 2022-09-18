function onCreate()
	--Iterate over all notes
	makeAnimatedLuaSprite('glitch', 'static', -600, -300);
	scaleObject('glitch', 2, 2);
	addAnimationByPrefix('glitch', 'glitchout', 'static glitch', 24, true);
	objectPlayAnimation('glitch', 'glitchout');
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Arm' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Arm'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let smurfette/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Arm' then
		playSound('slash', 0.6);
		characterPlayAnim('smurfette', 'smurfette atack', true);
		setProperty('1.specialAnim', true);
		characterPlayAnim('pibbyplay', 'dodge', true);
		setProperty('pibbyplay.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Arm' then
		setProperty('health', getProperty('health')-0.49);
		playSound('slash', 0.6);
		addLuaSprite('glitch', true); -- false = add behind characters, true = add over characters
		characterPlayAnim('smurfette', 'atack', true);
		characterPlayAnim('pibbyplay', 'hurt', true);
		setProperty('pibbyplay.specialAnim', true);
		setProperty('smurfette.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.1);
	end
end