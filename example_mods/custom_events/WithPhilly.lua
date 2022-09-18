-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'WithPhilly' then
		duration = tonumber(value1);
		if duration < 0 then
			duration = 0;
		end

		targetAlpha = tonumber(value2);
		if duration == 0 then
        setProperty('stageback.alpha', targetAlpha);
        setProperty('stagefront.alpha', targetAlpha);
        setProperty('stagelight_left.alpha', targetAlpha);
        setProperty('stagelight_right.alpha', targetAlpha);
        setProperty('stagecurtains.alpha', targetAlpha);
		else
			doTweenAlpha('stagebackFadeEventTween', 'stageback', targetAlpha, duration, 'linear');
                                                doTweenAlpha('stagefrontFadeEventTween', 'stagefront', targetAlpha, duration, 'linear');
			doTweenAlpha('stagelight_leftFadeEventTween', 'stagelight_left', targetAlpha, duration, 'linear');
                                                doTweenAlpha('stagelight_rightTrainFadeEventTween', 'stagelight_right', targetAlpha, duration, 'linear');
			doTweenAlpha('stagecurtainsFadeEventTween', 'stagecurtains', targetAlpha, duration, 'linear');
		end
		-- ñ
	end
end