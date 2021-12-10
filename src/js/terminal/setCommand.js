(async () => {
let shellScript = await callBTT('get_string_variable', {variable_name:'shellCommand'})

let appleScript = `
    set myCommand to display dialog "What is your command?" default answer ${shellScript}
    return text returned of myCommand
`;

shellScript = await runAppleScript(appleScript);
if(shellScript) {
	await callBTT('set_string_variable', {variable_name: 'shellCommand', to: shellScript});
	await callBTT('trigger_named', {trigger_name: 'refresh terminal'});
}


returnToBTT(shellScript);
})();
