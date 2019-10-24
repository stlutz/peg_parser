as yet unclassified
testSequence
	| fixture |
	
	fixture :=
		'{ "grammar" : "G { ruleOne = \"a\" \"bc\" \"z\" }",
		"matchContents" : [ { "input" : "", "expect" : false },
		                                 { "input" : "a", "expect" : false },
				                     { "input" : "aa", "expect" : false },
		                                 { "input" : "ab", "expect" : false },
				                     { "input" : "abb", "expect" : false },
		                                 { "input" : "abc", "expect" : false },
							   { "input" : "abcz", "expect" : true },
							   { "input" : "abcz123", "expect" : true, "streamAtEnd" : false }],
		"matchInterval" : [ 	   { "input" : "abcz", "expectInterval" : [1, 5]},
							   { "input" : "abcz1", "expectInterval" : [1, 5]} ],
		"matchTree" : [ 	   { "input" : "abcz", 
								"expectedTree" : {"ruleName" : "ruleOne", 
													"children" : [ {"ruleName" : "_terminal"} ,
																 {"ruleName" : "_terminal"},
																 {"ruleName" : "_terminal"} ] } } ] }'.

	self assertFixture: fixture.