as yet unclassified
generate: aGrammarName inheritFrom: superclass
	| parserClass |
	parserClass := superclass subclass: ('PEGParser' , aGrammarName) asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'PEG-ParserGenerator-Parsers'.

	ruleDefinitions keysAndValuesDo: [:ruleName :exprGenerator |
		exprGenerator compile: ('parse_' , ruleName) into: parserClass.
		(PEGExprApplyGenerator newWithRule: ruleName) compile: ('apply_' , ruleName) into: parserClass].
	
	ruleExtensions keysAndValuesDo: [:ruleName :exprGenerator |
		exprGenerator compile: ('parse_' , ruleName) into: parserClass.
		(PEGExprApplyExtendGenerator newWithRule: ruleName) compile: ('apply_' , ruleName) into: parserClass].

	^ parserClass