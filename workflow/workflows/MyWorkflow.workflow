{
	"contents": {
		"1d4a355e-e8f8-4bf5-8953-0a19699001a3": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "namespace.myworkflow",
			"subject": "MyWorkflow",
			"name": "MyWorkflow",
			"documentation": "MyWorkflow description",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"355b114b-c268-4df7-a350-c1eb0a0863ac": {
					"name": "Check Initial Data"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"764fa6a8-8631-4b64-95df-47b0211f10b2": {
					"name": "SequenceFlow2"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "355b114b-c268-4df7-a350-c1eb0a0863ac"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"d090a954-a54f-4b67-9239-5f23120816c4": {},
				"ab1fbbae-511b-40fe-8fd9-1cfbf4fb35c5": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 100,
			"y": 100,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 340,
			"y": 100,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "116,116 232,116",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "d090a954-a54f-4b67-9239-5f23120816c4",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"sequenceflow": 2,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1
		},
		"355b114b-c268-4df7-a350-c1eb0a0863ac": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "WF LeverX",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://workflow.workflow/workflow",
			"recipientUsers": "egorprostoy@gmail.com",
			"userInterfaceParams": [],
			"id": "usertask1",
			"name": "Check Initial Data"
		},
		"d090a954-a54f-4b67-9239-5f23120816c4": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 182,
			"y": 86,
			"width": 100,
			"height": 60,
			"object": "355b114b-c268-4df7-a350-c1eb0a0863ac"
		},
		"764fa6a8-8631-4b64-95df-47b0211f10b2": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "355b114b-c268-4df7-a350-c1eb0a0863ac",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"ab1fbbae-511b-40fe-8fd9-1cfbf4fb35c5": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "232,116.75 357.5,116.75",
			"sourceSymbol": "d090a954-a54f-4b67-9239-5f23120816c4",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "764fa6a8-8631-4b64-95df-47b0211f10b2"
		}
	}
}