as yet unclassified
buildLeftRecursiveGraph
	| collectedGrammars rules currentGrammar |
	
	graph := DirectedGraph new.
	collectedGrammars := Set new.
	rules := LinkedList new.

	currentGrammar := grammar.
	[collectedGrammars includes: currentGrammar] whileFalse: [
		currentGrammar ruleDeclarations keysAndValuesDo: [:ruleName :rule |
			self addExpr: rule body withName: ruleName].
		collectedGrammars add: currentGrammar.
		currentGrammar := currentGrammar superGrammar].
	
	^ graph
