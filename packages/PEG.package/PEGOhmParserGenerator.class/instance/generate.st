as yet unclassified
generate
	| superclass |
	grammar == grammar superGrammar
		"Ohm-grammar has no parent grammar."
		ifTrue: [superclass := PEGParser]
		"Inherit from class that is converted from parent grammar."
		ifFalse: [superclass := self class generateFrom: grammar superGrammar].

	generator := PEGParserGenerator new.
	grammar ruleDeclarations keysAndValuesDo: [:ruleName :ruleDefinition |
		"Only convert rules that have no parameters"
		ruleDefinition parameters size == 0
			ifTrue: [
				| expr convertedExpr |
				expr := ruleDefinition body.
				
				"check if rule needs to be extended"
				(ruleDefinition isMemberOf: OhmRuleExtend) ifTrue: [
					expr := OhmPExprAlt newOn: {expr . grammar superGrammar ruleNamed: ruleName}].

				[
				convertedExpr := self convertExpr: expr isSyntactic: (ruleName at: 1) isUppercase.
				generator defineRule: ruleName asSymbol withExpr: convertedExpr
				] on: PEGOhmExprConversionException do: ["everything alright"] ] ].
	
	^ generator generate: grammar grammarName inheritFrom: superclass