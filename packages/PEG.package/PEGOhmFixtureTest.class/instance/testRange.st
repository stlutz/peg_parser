as yet unclassified
testRange
	| fixture |
	
	fixture :=
		'{ 
           "grammar" : "M { foo = \"0\"..\"9\" }",
		"matchContents" : 
		[	{ "input" : "0", "expect" : true },
			{ "input" : "92", "expect" : true, "streamAtEnd" : false},
			{ "input" : "x2", "expect" : false, "streamAtEnd" : false } ],
		"matchInterval" :
		[ 	{"input" : "01", "expectInterval" : [1,2] },
			{"input" : "909", "expectInterval" : [1,2] } ] }'.
	
	self assertFixture: fixture.