as yet unclassified
testEnd
	| fixture |
	
	fixture :=
		'{ "grammar" : "G {
						rule = \"foo\" end}",
		"matchContents" : [ { "input" : "bar", "expect" : false, "streamAtEnd" : false},
							   { "input" : "foo", "expect" : true, "streamAtEnd" : true },
							   { "input" : "foo1", "expect" : false, "streamAtEnd" : false } ] }'.
	
	self assertFixture: fixture