parsing
parse: parseString startingFrom: ruleName
	| methodSignature parseResult |
	string := parseString.
	memoization := (1 to: parseString size) collect: [:index | IdentityDictionary new].
	heads := Array new: parseString size.
	leftRecursionStack := LinkedList new.
	rightmostFailure := PEGParserFailure newAt: 0.
	
	methodSignature := ('apply_' , ruleName , ':') asSymbol.
	parseResult := self perform: methodSignature with: 1.


	parseResult == nil ifFalse: [
		| endPos |
		endPos := self skipSpaces: parseResult endPos.
		endPos == (string size + 1) ifTrue: [
			^ PEGMatchResult new
				cst: parseResult;
				yourself]].
		
	^ PEGFailedMatchResult new
		cst: parseResult;
		failure: self rightmostFailure;
		yourself