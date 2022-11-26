sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'workflowstarter/test/integration/FirstJourney',
		'workflowstarter/test/integration/pages/HeaderList',
		'workflowstarter/test/integration/pages/HeaderObjectPage',
		'workflowstarter/test/integration/pages/ItemObjectPage'
    ],
    function(JourneyRunner, opaJourney, HeaderList, HeaderObjectPage, ItemObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('workflowstarter') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheHeaderList: HeaderList,
					onTheHeaderObjectPage: HeaderObjectPage,
					onTheItemObjectPage: ItemObjectPage
                }
            },
            opaJourney.run
        );
    }
);