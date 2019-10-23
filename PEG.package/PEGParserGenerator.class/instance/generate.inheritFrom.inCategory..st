generate
generate: aGrammarName inheritFrom: superclass inCategory: category
	
	^ (PEGBuildParser newWithRuleDefinitions: ruleDefinitions name: aGrammarName superclass: superclass category: category) result