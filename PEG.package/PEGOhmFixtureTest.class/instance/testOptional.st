as yet unclassified
testOptional
	| fixture |
	
	fixture :=
		'{ "grammar" : "G {
						ruleOne = \"dr\"? }",
		"matchContents" : [ { "input" : "", "expect" : true },
							   { "input" : "dr", "expect" : true },
							   { "input" : "d", "expect" : true, "streamAtEnd" : false } ],
		"matchInterval" : [ 	   { "input" : "", "expectInterval" : [1,1] },
							   { "input" : "dr", "expectInterval" : [1,3] },
							   { "input" : "d", "expectInterval" : [1,1] } ],
		"matchTree" : [ 	   { "input" : "",
								"expectedTree" : {"ruleName" : "ruleOne", "children" : [{"ruleName" : "_terminal", "children" : [] }] } },
							   { "input" : "dr", 
								"expectedTree" : {"ruleName" : "ruleOne", "children" : [{"ruleName" : "_terminal" }] } } ] }'.
	
	self assertFixture: fixture.