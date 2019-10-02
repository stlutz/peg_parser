as yet unclassified
newWith: ruleDefinitions with: grammarName with: superclass
	^ self new
		ruleDefinitions: ruleDefinitions;
		grammarName: grammarName;
		superclass: superclass;
		yourself