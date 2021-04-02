private
reportFailureOf: aRule atPos: pos
	pos < rightmostFailure pos ifTrue: [^ nil].

	pos > rightmostFailure pos ifTrue: [
		rightmostFailure := PEGParserFailure newAt: pos].

	rightmostFailure add: aRule