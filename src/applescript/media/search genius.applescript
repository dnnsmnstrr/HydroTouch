try
	if application "Spotify" is running then
		tell application "Spotify"
			try
				set theTrack to name of the current track
				set theArtist to artist of the current track
			end try
		end tell
    open location "https://genius.com/search?q=" & theTrack & " - " & theArtist
	else
		return "Spotify not running"
	end if
on error
	return "Couldn't open Genius"
end try
