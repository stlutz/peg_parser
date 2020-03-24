evaluation
result
	(superclass includesBehavior: PEGParser) ifFalse: [
		self error: 'Class must inherit from PEGParser.'].
	
	category ifNil: [category := 'PEG-GeneratedParsers'].
	
	parserClass := superclass subclass: self classIdentifier
		instanceVariableNames: ''
		classVariableNames: ''
		poolDictionaries: ''
		category: category.
	
	parserClass ruleDefinitions: ruleDefinitions.
	
	self buildDerivationGraph.
	self reduceDerivationGraph.
	self buildLeftRecursionGraph.
	self extractRuleIdentifiers.
	
	ruleDefinitions keysAndValuesDo: [:ruleName :exprGenerator |
		exprGenerator compile: ('parse_' , ruleName) into: parserClass].
	
	parserClass leftRecursiveIdentifiers do: [:ruleName |
		| parentLeftRecursiveIdentifiers |
		parentLeftRecursiveIdentifiers := parserClass superclass leftRecursiveIdentifiers.
		(parentLeftRecursiveIdentifiers == nil or: [(parentLeftRecursiveIdentifiers includes: ruleName) not])
			ifTrue: [(PEGExprLeftRecursiveApplyGenerator newWithRule: ruleName) compile: ('apply_' , ruleName) into: parserClass]].
	
	parserClass nonLeftRecursiveIdentifiers do: [:ruleName |
		| parentNonLeftRecursiveIdentifiers |
		parentNonLeftRecursiveIdentifiers := parserClass superclass nonLeftRecursiveIdentifiers.
		(parentNonLeftRecursiveIdentifiers == nil or: [(parentNonLeftRecursiveIdentifiers includes: ruleName) not])
			ifTrue: [(PEGExprApplyGenerator newWithRule: ruleName) compile: ('apply_' , ruleName) into: parserClass]].

	^ parserClass