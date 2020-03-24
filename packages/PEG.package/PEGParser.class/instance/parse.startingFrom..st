parsing
parse: parseString startingFrom: ruleName
	| methodSignature parseResult startPosition |
	self initializeParsingInformationFor: parseString.
	
	startPosition := (self isSyntactic: ruleName) 
		ifTrue: [self skipSpaces: 1]
		ifFalse: [1].
	
	methodSignature := ('apply_' , ruleName , ':') asSymbol.
	parseResult := self perform: methodSignature with: startPosition.

	parseResult ifNotNil: [
		(parseResult endPos = (string size + 1) or: [(self skipSpaces: parseResult endPos) = (string size + 1)]) ifTrue: [
			^ PEGMatchResult new
				cst: parseResult;
				yourself]].
		
	^ PEGFailedMatchResult new
		cst: parseResult;
		failure: self rightmostFailure;
		yourself