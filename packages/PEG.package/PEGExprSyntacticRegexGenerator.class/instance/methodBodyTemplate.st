accessing
methodBodyTemplate

	^ '| char skipPos |
	skipPos := self skipSpaces: pos.
	char := string at: skipPos ifAbsent: [^ nil].
	^ ((RxParser preferredMatcherClass for: (RxParser new parse: ''{1}'')) matches: char asString)
		ifTrue: [
			PEGNode newOn: #_terminal for: string from: skipPos to: skipPos + 1 children: \{char asString\}]
		ifFalse: [
			self reportFailureOf: #regexString atPos: skipPos.
			nil]' format: {regexString}