tell application "BetterTouchTool"
	--requires a named trigger "open {APP/GROUP}" to work
	set trigger to display dialog "Which group or app would you like to open? (lowercase)" default answer ""

	try
		set response to trigger_named "open " & text returned of trigger
		try
			return response
			--display dialog response
		end try

	on error
		display dialog "Error executing named trigger"
	end try

end tell
