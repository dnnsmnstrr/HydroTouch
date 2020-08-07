--@Felipeforerome Adapted from the iTunes Song.Link widget

----GET SPOTIFY LINK----
try
	if application "Spotify" is running then
		tell application "Spotify"
			try
				set theTrack to name of the current track
				set theArtist to artist of the current track
			end try
		end tell
	else
		return ""
	end if
	
	tell application "Safari"
		activate
		tell window 1
			set current tab to (make new tab with properties {URL:"https://genius.com/search?q=" & theTrack & " - " & theArtist})
		end tell
	end tell
on error
	return "Couldn't open Genius"
end try
