as yet unclassified
testPlus
	| fixture |
	
	fixture :=
		'{ "grammar" : "G {
						ruleOne = (\"a\" \"b\")+ }",
		"matchContents" : [ { "input" : "", "expect" : false },
		                                 { "input" : "a", "expect" : false },
		                                 { "input" : "ba", "expect" : false},
		                                 { "input" : "abab", "expect" : true},
		                                 { "input" : "ababab", "expect" : true},		
		                                 { "input" : "b", "expect" : false},
							   { "input" : "ab", "expect" : true} ],
		"matchInterval" : [	   { "input" : "ab", "expectInterval" : [1,3] },
		                                 { "input" : "abab", "expectInterval" : [1,5] },		
		                                 { "input" : "ababab", "expectInterval" : [1,7] } ]
		  }'.
	
	self assertFixture: fixture.