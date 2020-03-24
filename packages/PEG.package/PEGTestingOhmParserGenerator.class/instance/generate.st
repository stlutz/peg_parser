utility
generate
	| superclass |
	grammar == grammar superGrammar
		"Ohm-grammar has no parent grammar."
		ifTrue: [superclass := PEGParser]
		"Inherit from class that is converted from parent grammar."
		ifFalse: [
			SystemChangeNotifier uniqueInstance doSilently: [
				superclass := self class generateFrom: grammar superGrammar category: category suffix: self suffix]].

	generator := PEGParserGenerator new.
	grammar ruleDeclarations keysAndValuesDo: [:ruleName :ruleDefinition |
		"Only convert rules that have no parameters"
		ruleDefinition parameters ifEmpty: [| expr convertedExpr |
			expr := ruleDefinition body.
			
			"check if rule needs to be extended"
			(ruleDefinition isMemberOf: OhmRuleExtend) ifTrue: [
				expr := OhmPExprAlt newOn: {expr . grammar superGrammar ruleNamed: ruleName}].

			[convertedExpr := self convertExpr: expr isSyntactic: ruleName first isUppercase.
			generator defineRule: ruleName asSymbol withExpr: convertedExpr] 
				on: PEGOhmExprConversionException do: ["everything alright"] ] ].
	
	SystemChangeNotifier uniqueInstance doSilently: [
		^ generator generate: grammar grammarName , suffix inheritFrom: superclass inCategory: category]