as yet unclassified
generate: aGrammarName inheritFrom: superclass
	| derivationGraph parserClass |
	(superclass includesBehavior: PEGParser) ifFalse: [
		self error: 'Class must inherit from PEGParser.'].
	
	derivationGraph := self buildDerivationGraph.
	
	parserClass := superclass subclass: ('PEGParser' , aGrammarName) asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'GeneratedPEGParsers'.

	ruleDefinitions keysAndValuesDo: [:ruleName :exprGenerator |
		exprGenerator compile: ('parse_' , ruleName) into: parserClass.
		(PEGExprApplyGenerator newWithRule: ruleName) compile: ('apply_' , ruleName) into: parserClass].

	^ parserClass