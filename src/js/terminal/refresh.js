(async () => {
	//run using: await callBTT('trigger_named', {trigger_name: 'refresh terminal'});
	const UUID_LEFT = '6B338FF3-90DF-449B-8646-DCA8DEA923D1' // the button showing the current command
  const UUID_RIGHT = '6ACF2130-E58B-43F4-AC7C-3E93A13454FC' // the button displaying the result
	callBTT('refresh_widget', {uuid: UUID_LEFT});
	callBTT('refresh_widget', {uuid: UUID_RIGHT});
	returnToBTT();
})();
