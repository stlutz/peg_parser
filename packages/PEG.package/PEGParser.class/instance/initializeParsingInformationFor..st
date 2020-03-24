private
initializeParsingInformationFor: parseString

	string := parseString.
	memoization := (1 to: parseString size + 1) collect: [:index | IdentityDictionary new].
	heads := Array new: parseString size + 1.
	leftRecursionStack := LinkedList new.
	rightmostFailure := PEGParserFailure newAt: 0.