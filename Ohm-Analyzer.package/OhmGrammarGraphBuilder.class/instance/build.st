as yet unclassified
build
	| rules |
	
	graph := DirectedGraph new.
	rules := LinkedList new.
	grammar ruleDeclarations keysAndValuesDo: [:ruleName :rule |
		self addExpr: rule body withName: ruleName].

	^ graph