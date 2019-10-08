generate
generate: aGrammarName inheritFrom: superclass
	
	^ (PEGBuildParser newWith: ruleDefinitions with: aGrammarName with: superclass) result