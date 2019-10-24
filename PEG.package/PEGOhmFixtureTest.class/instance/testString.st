as yet unclassified
testString
	| fixture |
	
	fixture :=
		'{ 
           "grammar" : "M { foo = \"foo\" }",
           "matchContents" : 
		[ 	{"input" : "foo", "expect" : true},
			{"input" : "foo1", "expect" : false},
			{"input" : "bar", "expect" : false},
			{ "input" : "foo1", "expect" : true, "streamAtEnd" : false} ],
		"matchInterval" :
		[ 	{"input" : "foo", "expectInterval" : [1,4] },
			{"input" : "foo1", "expectInterval" : [1,4] } ],
		"matchTree" :
		[ 	{"input" : "foo", "expectedTree" : {"ruleName":"foo", "children":[{"ruleName" : "_terminal" }]} } ] }'.

	self assertFixture: fixture.