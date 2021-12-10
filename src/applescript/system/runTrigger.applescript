set activeApp to my getActiveApp()
tell application activeApp

	set trigger to display dialog "Enter the trigger you would like to run:" default answer ""

end tell

tell application "BetterTouchTool"

	try
		trigger_named_async_without_response text returned of trigger
	on error
		display notification "Could not execute named trigger." with title "Error"
	end try

end tell

on getActiveApp()
	tell application "System Events" to set activeApp to first process where it is frontmost
	return name of activeApp
end getActiveApp
