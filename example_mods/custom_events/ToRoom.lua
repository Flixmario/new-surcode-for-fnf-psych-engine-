-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'ToRoom' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if duration == 0 then
        setProperty('timmy_room', targetAlpha);

		else
			doTweenAlpha('timmy_roomFadeEventTween', 'timmy_room', targetAlpha, duration, 'linear');
		end
		-- ñ
	end
end