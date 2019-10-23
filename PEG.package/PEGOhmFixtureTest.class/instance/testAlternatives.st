as yet unclassified
testAlternatives
	| fixture |
	
	fixture :=
		'{ "grammar" : "G {
						ruleOne = \"a\" | \"b\"}",
		"matchContents" : [ { "input" : "", "expect" : false },
		                                 { "input" : "a", "expect" : true},
							   { "input" : "b", "expect" : true},
							   { "input" : "ab", "expect" : true, "streamAtEnd" : false} ],
		"matchInterval" : [ 	   { "input" : "a", "expectInterval" : [1,2] },
							   { "input" : "b", "expectInterval" : [1,2] },
							   { "input" : "ab", "expectInterval" : [1,2] } ],
		"matchTree" : [ 		   { "input" : "a", "expectedTree" : {"ruleName" : "ruleOne", "children": [{"ruleName" : "_terminal"}]} },
							   { "input" : "b", "expectedTree" : {"ruleName" : "ruleOne", "children": [{"ruleName" : "_terminal"}]} } ] }'.
	
	self assertFixture: fixture