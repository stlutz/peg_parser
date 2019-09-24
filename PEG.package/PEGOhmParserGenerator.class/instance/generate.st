as yet unclassified
generate
	| superclass |
	grammar == grammar superGrammar ifFalse: [
		superclass := PEGOhmParserGenerator generateFrom: grammar superGrammar].

	generator := PEGParserGenerator new.
	grammar ruleDeclarations keysAndValuesDo: [:ruleName :ruleDefinition |
		| expr convertedExpr |
		expr := ruleDefinition body.
		
		"check if rule needs to be extended"
		(ruleDefinition isMemberOf: OhmRuleExtend) ifTrue: [
			expr := OhmPExprAlt newOn: {expr . grammar superGrammar ruleNamed: ruleName}].

		convertedExpr := self convertExpr: expr isSyntactic: (ruleName at: 1) isUppercase.
		generator defineRule: ruleName asSymbol withExpr: convertedExpr].
	
	^ superclass
		ifNil: [generator generate: grammar grammarName]
		ifNotNil: [generator generate: grammar grammarName inheritFrom: superclass]