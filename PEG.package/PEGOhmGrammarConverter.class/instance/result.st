as yet unclassified
result
	builder := PEGBuilder new.

	grammar ruleDeclarations keysAndValuesDo: [:ruleName :ruleDefinition |
		| expr convertedExpr |
		expr := ruleDefinition body.
		convertedExpr := (ruleName at: 1) isUppercase "isSyntactic"
			ifTrue: [self convertExpr: expr isSyntactic: true]
			ifFalse: [self convertExpr: expr isSyntactic: false].
		builder addRule: (ruleName asSymbol) withExpr: convertedExpr].

	^ builder buildGrammar