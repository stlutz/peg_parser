as yet unclassified
testApply
	| fixture |
	
	fixture :=
		'{ "grammar" : "G {
						firstRule = \"firstRule\" }",
		"matchContents" : [ { "input" : "", "expect" : false },
							   { "input" : "firstRule", "expect" : true },
							   { "input" : "firstRule secondRule", "expect" : true, "streamAtEnd" : false } ],
		"matchInterval" : 	 [ { "input" : "firstRule", "expectInterval" : [1,10] },
							   { "input" : "firstRule secondRule", "expectInterval" : [1,10] } ] }'.
	
	self assertFixture: fixture