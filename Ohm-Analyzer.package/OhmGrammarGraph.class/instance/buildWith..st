as yet unclassified
buildWith: aGrammar
	| collectedGrammars rules currentGrammar |
	
	grammar := aGrammar.
	
	collectedGrammars := Set new.
	rules := LinkedList new.
	
	currentGrammar := aGrammar.
	[collectedGrammars includes: currentGrammar] whileFalse: [
		currentGrammar ruleDeclarations keysAndValuesDo: [:ruleName :rule |
			rules add: (Pair a: rule b: ruleName)].
	collectedGrammars add: currentGrammar.
	currentGrammar := currentGrammar superGrammar ].

	rules do: [:rulePair |
		self addExprNode: rulePair a body withRuleName: rulePair b].