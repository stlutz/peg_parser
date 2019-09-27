as yet unclassified
generate: aGrammarName inheritFrom: superclass
	| parserClass |
	(superclass includesBehavior: PEGParser) ifFalse: [
		self error: 'Class must inherit from PEGParser.'].
	
	parserClass := superclass subclass: ('PEGParser' , aGrammarName) asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: 'GeneratedPEGParsers'.
	
	parserClass ruleDefinitions: ruleDefinitions.
	self buildDerivationGraph: parserClass.
	self findLeftRecursiveIdentifiers: parserClass.
	
	ruleDefinitions keysAndValuesDo: [:ruleName :exprGenerator |
		exprGenerator compile: ('parse_' , ruleName) into: parserClass.
		(PEGExprApplyGenerator newWithRule: ruleName) compile: ('apply_' , ruleName) into: parserClass].

	^ parserClass