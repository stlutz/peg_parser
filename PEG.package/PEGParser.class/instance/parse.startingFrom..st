as yet unclassified
parse: string startingFrom: ruleName
	| methodSignature |
	memoization := (1 to: string size) collect: [:index | IdentityDictionary new].
	heads := Array new: string size.
	leftRecursionStack := LinkedList new.
	rightmostFailure := PEGParserFailure newAt: 0.
	
	methodSignature := ('apply_' , ruleName , ':atPos:') asSymbol.
	^ self perform: methodSignature withArguments: {string . 1}