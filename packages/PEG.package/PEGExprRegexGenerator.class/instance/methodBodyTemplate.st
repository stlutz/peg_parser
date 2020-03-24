accessing
methodBodyTemplate

	^ '| char |
	char := string at: pos ifAbsent: [^ nil].
	^ ((RxParser preferredMatcherClass for: (RxParser new parse: ''{1}'')) matches: char asString)
		ifTrue: [
			PEGNode newOn: #_terminal for: string from: pos to: pos + 1 children: \{char asString\}]
		ifFalse: [
			self reportFailureOf: #regexString atPos: pos.
			nil]' format: {regexString}