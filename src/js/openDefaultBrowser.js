(async () => {
  let script = `plutil -p ~/Library/Preferences/com.apple.LaunchServices/com.apple.launchservices.secure.plist | grep 'https' -b3 |awk 'NR==3 {split($4, arr, \"\\\"\"); print arr[2]}'`
  let default_app = await runShellScript({ script });

  let appleScript = `tell application id \"${default_app}\" to activate`
  let result = await runAppleScript(appleScript);

  returnToBTT(default_app);
})();