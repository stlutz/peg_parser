as yet unclassified
testAlternativesAndSequence
	| fixture |
	
	fixture :=
		'{ "grammar" : "G {
						ruleOne = \"a\" \"b\" \"c\" | \"1\" \"2\" \"3\"}",
		"matchContents" : [ { "input" : "ab", "expect" : false, "streamAtEnd" : false },
							   { "input" : "12", "expect" : false, "streamAtEnd" : false },
							   { "input" : "", "expect" : false },  
							   { "input" : "abc", "expect" : true },
							   { "input" : "123", "expect" : true } ] }'.
	
	self assertFixture: fixture