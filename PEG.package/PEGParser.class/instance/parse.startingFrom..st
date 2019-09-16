as yet unclassified
parse: string startingFrom: ruleName
	| methodSignature parseResult |
	memoization := (1 to: string size) collect: [:index | IdentityDictionary new].
	heads := Array new: string size.
	leftRecursionStack := LinkedList new.
	rightmostFailure := PEGParserFailure newAt: 0.
	
	methodSignature := ('apply_' , ruleName , ':atPos:') asSymbol.
	parseResult := self perform: methodSignature withArguments: {string . 1}.
	
	
	
	parseResult == nil ifFalse: [
		| endPos |
		endPos := self skipSpaces: string atPos: parseResult endPos.
		endPos == (string size + 1) ifTrue: [
			^ PEGMatchResult new
				cst: parseResult;
				yourself]].
		
	^ PEGFailedMatchResult new
		cst: parseResult;
		failure: self rightmostFailure;
		yourself