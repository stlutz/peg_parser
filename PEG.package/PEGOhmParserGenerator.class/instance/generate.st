as yet unclassified
generate
	generator := PEGParserGenerator new.

	grammar ruleDeclarations keysAndValuesDo: [:ruleName :ruleDefinition |
		| expr convertedExpr |
		expr := ruleDefinition body.
		convertedExpr := self convertExpr: expr isSyntactic: (ruleName at: 1) isUppercase.
		generator addRule: (ruleName asSymbol) withExpr: convertedExpr].
	
	^ generator generate: grammar grammarName