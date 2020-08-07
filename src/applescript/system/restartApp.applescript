---
-- Restart the currently active app
-- based on: https://gist.github.com/jtwalters/9357018
---

set appName to my getActiveApp()
tell application appName to quit
repeat
	tell application "System Events"
		if appName is not in (name of application processes) then exit repeat
	end tell
	do shell script "sleep 0.5"
end repeat
tell application appName to launch

-- Return the active app as a String
on getActiveApp()
	tell application "System Events" to set activeApp to first process where it is frontmost
	return name of activeApp
end getActiveApp
