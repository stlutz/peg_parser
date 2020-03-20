as yet unclassified
testNot
	| fixture |
	
	fixture :=
		'{ "grammar" : "G {
						ruleOne = ~\"hello\" }",
		"matchContents" : [ { "input" : "", "expect" : true },
							   { "input" : "hello world", "expect" : false, "streamAtEnd" : false },
							   { "input" : "yello world", "expect" : true, "streamAtEnd" : false },
							   { "input" : "yello", "expect" : true, "streamAtEnd" : false },
							   { "input" : "hello", "expect" : false, "streamAtEnd" : false } ],
		"matchInterval" : [ 	   { "input" : "", "expectInterval" : [1, 1] },
							   { "input" : "yello world", "expectInterval" : [1, 1] },
							   { "input" : "yello", "expectInterval" : [1, 1] } ] }'.
	
	self assertFixture: fixture