set activeTab to my getActiveSafariTab()
tell application "Safari"
	repeat with w in windows
		repeat with t in tabs of w
			tell t
				if URL starts with "https://www.youtube.com" then
					if activeTab = index of t then
						repeat with t in tabs of w
							tell t
								if URL starts with "https://www.youtube.com/watch" then
									set current tab of w to t
									activate
									return
								end if
							end tell
						end repeat
					end if
					set current tab of w to t
					activate
					return "activated homepage"
				end if
			end tell
		end repeat
	end repeat
	open location "http://www.youtube.com"
	activate
	return "new tab"
end tell

on getActiveSafariTab()
	tell application "Safari" to return index of current tab of front window
end getActiveSafariTab
