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
		exprGenerator compile: ('parse_' , ruleName) into: parserClass].
	
	parserClass leftRecursiveIdentifiers do: [:ruleName |
		(parserClass superclass leftRecursiveIdentifiers ~= nil and: [parserClass superclass leftRecursiveIdentifiers includes: ruleName])
			ifFalse: [
				(PEGExprLeftRecursiveApplyGenerator newWithRule: ruleName) compile: ('apply_' , ruleName) into: parserClass]].
	
	parserClass nonLeftRecursiveIdentifiers do: [:ruleName |
		(parserClass superclass nonLeftRecursiveIdentifiers ~= nil and: [parserClass superclass nonLeftRecursiveIdentifiers includes: ruleName])
			ifFalse: [
				(PEGExprApplyGenerator newWithRule: ruleName) compile: ('apply_' , ruleName) into: parserClass]].

	^ parserClass