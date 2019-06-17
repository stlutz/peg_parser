as yet unclassified
result
	builder := PEGBuilder new.

	grammar ruleDeclarations keysAndValuesDo: [:ruleName :ruleDefinition |
		| expr convertedExpr |
		expr := ruleDefinition body.
		(ruleName at: 1) isUppercase "isSyntactic"
			ifTrue: [convertedExpr := self convertSyntacticExpr: expr]
			ifFalse: [convertedExpr := self convertExpr: expr].
		builder addRule: (ruleName asSymbol) withExpr: convertedExpr].

	^ builder buildGrammar