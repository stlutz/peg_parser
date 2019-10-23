as yet unclassified
testNotTree
	| fixture |
	
	fixture :=
		'{ "grammar" : "G {
						ruleOne = ~\"hello\" \"bar\"}",
		"matchTree" : [ { "input" : "bar", "expectedTree" : {"ruleName" : "ruleOne", "children" : [{"ruleName" : "_terminal"}] } }] }'.
	
	self assertFixture: fixture