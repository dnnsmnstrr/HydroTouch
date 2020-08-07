---
-- This script is made by @dnnsmnstrr to be run within BetterTouchTool
-- It checks what media is playing and activates the appropriate player
-- if it currently is not foremost, otherwise executes a useful command
---
on run argv

if (count of argv) > 1 then
    set action to (item 1 of argv)
else
    set action to text returned of (display dialog "What would you like to do:" default answer "pause")
end if

--- debugging stuff ---

--uncomment this to get the bundle identifier of the currently playing app
--return currentlyPlaying
--return spotifyState
--my playpause()
--return my validateInput(action)
--handleSpotify("playpause")

set playpause to {"pause", "play", "playpause"}
if action is in playpause then
  if pauseSpotify() then return "Quickly paused Spotify"
  set action to "playpause"
else if action is equal to "stop"
  pauseSpotify()
else if action is equal to "activate"

end if
set result to ""
set result to handleForeground(action)
if result is equal to "" then
  handleBackground(action)
end if


---------------------

end run

----  Functions  ----

-- Return the active app as a String
on getActiveApp()
	tell application "System Events" to set activeApp to first process where it is frontmost
	return name of activeApp
end getActiveApp

-- Return the index of the current tab in Safari's frontmost window
on getActiveSafariTab()
	tell application "System Events"
		try
			tell application "Safari" to return index of current tab of front window
		on error
			return "Could not get current safari tab"
		end try
	end tell
end getActiveSafariTab

-- Return the the bundle identifier of the currently playing app, as determined by BTT
on getCurrentlyPlaying()
	try
		tell application "BetterTouchTool" to return get_string_variable "BTTCurrentlyPlayingApp"
	on error
		return "Could not get currently playing app"
	end try
end getCurrentlyPlaying

-- Return the player state of spotify (playing or paused)
on getSpotifyState()
	if application "Spotify" is running then
		tell application "Spotify" to return player state as text
	end if
	return "not running"
end getSpotifyState

on pauseSpotify()
  set spotifyState to my getSpotifyState()
  --- quickly pause spotify if it is playing ---
  if spotifyState = "playing" then
    tell application "Spotify" to playpause
    return true
  end if
  return false
end pauseSpotify

on handleSpotify(action)
  	tell application "Spotify"
      if action = "playpause" then
        playpause
      else if action = "activate" then
        activate
      end if
    end tell
end handleSpotify

on handleForeground(action)
  set activeAppName to my getActiveApp()

  if activeAppName = "Spotify" then
  	tell application "Spotify"
  		playpause
  		return "Spotify in foreground"
  	end tell

  else if activeAppName = "Safari" then
  	tell application "Safari"
      set activeTab to my getActiveSafariTab()
  		if activeTab is not equal to "error" then
        repeat with w in windows
  				repeat with t in tabs of w
  					tell t
  						--Netflix
  						if URL starts with "https://www.netflix.com/watch" and activeTab = index of t then
  							if action is equal to "playpause" then
                  do JavaScript "var v = document.querySelector('video');
                    if (v.paused) {
                      v.play();
                    }
                    else {
                      v.pause();
                    }"

                else if action is equal to "stop" then
                  do JavaScript "document.querySelector('video').pause()"
                else if action is equal to "activate" then
                  if URL starts with "https://www.netflix.com/watch" then
  									set the URL to "https://www.netflix.com/browse"
  									return "Netflix - homepage"
  								else
  									close t
  								end if
                end if
                se to "Netflix in foreground"
                return
  						else if URL starts with "http://www.youtube.com/watch" or URL starts with "https://www.youtube.com/watch" then
  							if activeTab = index of t then --YouTube Player is open
  									do JavaScript "document.getElementsByClassName('ytp-play-button ytp-button')[0].click();"
                    se to "YouTube in foreground"
                    return
  							end if
  						end if
  					end tell
  				end repeat
  			end repeat
      end if
  		return "Safari in foreground"
  	end tell

  else if activeAppName = "iTunes" then
  	tell application "iTunes"
  		playpause
  		return "iTunes in foreground"
  	end tell

  else if activeAppName = "IINA" then
  	tell application "System Events"
  		key code 49 -- space bar
  		return "IINA in foreground"
  	end tell

  else if activeAppName = "Kodi" then
  	tell application "System Events"
  		key code 49 -- space bar
  		return "Kodi in foreground"
  	end tell

  else if activeAppName = "Amazon Music" then
  	tell application "System Events"
  		key code 49 -- space bar
  		return "Amazon Music in foreground"
  	end tell
  end if
  return ""
end handleForeground

on handleBackground(action)
  set activeAppName to my getActiveApp()
  set currentlyPlaying to my getCurrentlyPlaying()

  --use BTT's currently playing variable to check for players
  if currentlyPlaying = "com.spotify.client" then
  	tell application "Spotify"
  		if activeAppName = "Spotify" and action = "activate" then
  			tell application "Spotify" to next track
        return
      else if action = "activate" then
        activate
      end if
  		return "Spotify in background"
  	end tell
  else if currentlyPlaying = "com.colliderli.iina" then
  	if activeAppName = "IINA" then
  		tell application "BetterTouchTool"
  			trigger_named "pause"
  		end tell
  	else
  		activate application "IINA"
  	end if
  	return "IINA in background"
  else if currentlyPlaying = "com.apple.Safari" then
  	tell application "BetterTouchTool"
  		trigger_named "pause" -- this requires a named trigger with the play/pause action assigned
  	end tell
  	return "Safari in background"
  end if
end handleBackground

on handleSafari(action)
  if application "Safari" is running then
  	tell application "Safari"
  		set activeTab to my getActiveSafariTab()
  		if activeTab is not equal to "error" then
  			repeat with w in windows
  				repeat with t in tabs of w
  					tell t
  						if URL starts with "http://www.youtube.com/watch" or URL starts with "https://www.youtube.com/watch" or URL starts with "https://www.netflix.com/watch" then
  							if index of t is equal to activeTab then
  								if URL starts with "https://www.netflix.com/watch" then
  									set the URL to "https://www.netflix.com/browse"
  									return "Netflix - homepage"
  								else
  									close t
  								end if
  							else
  								set current tab of w to t
  								activate
  							end if
  							return
  						end if
  					end tell
  				end repeat
  			end repeat
  		end if
  	end tell
  end if
end handleSafari

on validateInput(action)
  set actions to {"pause", "play", "playpause", "stop", "skip", "activate"}
  if actions contains action
  else
  displayError("Input action is not valid", {"Don't Continue", "Continue"})
  end if
end validateInput

on displayError(theErrorMessage, theButtons)
    display dialog theErrorMessage buttons theButtons
end displayError

on finish(message)
  display dialog message

end finish
