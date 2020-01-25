---
-- Find an open Netflix tab and make it visible. Pause Spotify if it is playing.
---

set activeTab to my getActiveSafariTab()
set activeAppName to my getActiveApp()
tell application "Safari"
	repeat with w in windows
		repeat with t in tabs of w
			tell t
				if URL starts with "https://www.netflix.com/watch" or URL starts with "https://www.netflix.com/browse" or URL starts with "https://www.netflix.com/title" then
					set current tab of w to t
					if activeTab = index of t then
						if activeAppName = "Safari" then
							tell application "Spotify" to set spotifyState to (player state as text)
							if spotifyState is equal to "playing" then
								tell application "Spotify" to playpause
							end if
							tell application "System Events"
								key code 49 -- space bar
							end tell
							return "Safari - foreground"
						end if
					end if
					activate
					return activeAppName
				end if
			end tell
		end repeat
	end repeat
end tell

on getActiveApp()
	tell application "System Events" to set activeApp to first process where it is frontmost
	return name of activeApp
end getActiveApp

on getActiveSafariTab()
	tell application "Safari" to return index of current tab of front window
end getActiveSafariTab
