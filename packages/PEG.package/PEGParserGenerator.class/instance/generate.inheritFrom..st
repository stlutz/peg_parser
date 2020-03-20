generate
generate: aGrammarName inheritFrom: superclass
	
	^ (PEGBuildParser newWithRuleDefinitions: ruleDefinitions name: aGrammarName superclass: superclass) result