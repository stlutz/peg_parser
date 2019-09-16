as yet unclassified
generate
	| superclass |
	grammar == grammar superGrammar ifFalse: [
		superclass := PEGOhmParserGenerator generateFrom: grammar superGrammar].

	generator := PEGParserGenerator new.
	grammar ruleDeclarations keysAndValuesDo: [:ruleName :ruleDefinition |
		| expr convertedExpr |
			expr := ruleDefinition body.
			convertedExpr := self convertExpr: expr isSyntactic: (ruleName at: 1) isUppercase.
		(ruleDefinition isMemberOf: OhmRuleExtend)
			ifTrue: [generator extendRule: ruleName asSymbol withExpr: convertedExpr]
			ifFalse: [generator defineRule: ruleName asSymbol withExpr: convertedExpr]].
	
	^ superclass
		ifNil: [generator generate: grammar grammarName]
		ifNotNil: [generator generate: grammar grammarName inheritFrom: superclass]