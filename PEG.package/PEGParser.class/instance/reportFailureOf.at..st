as yet unclassified
reportFailureOf: aRule at: pos
	pos < rightmostFailure pos ifTrue: [^ nil].

	pos > self rightmostFailure pos ifTrue: [
		rightmostFailure := PEGParserFailure newAt: pos].

	rightmostFailure add: aRule