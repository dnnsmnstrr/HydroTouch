--launch a spotify playlist in shuffle by URI

on run argv
      if (count of argv) > 0 then
          set URI to item 1 of argv
      else
          set URI to text returned of (display dialog "Enter a spotify uri:" default answer "")
      end if
      if application "Spotify" is running then
      tell application "Spotify"
      	set shuffling to true
      	play track URI
      end tell
    else
    	return "not running"
    end if
end run
