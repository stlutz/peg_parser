accessing
methodBodyTemplate

	self flag: #todo. "is regexString escaped?"
	^ '| char skipPos |
	skipPos := self skipSpaces: pos.
	char := string at: skipPos ifAbsent: [^ nil].
	((RxParser preferredMatcherClass for: (RxParser new parse: ''{1}'')) matches: char asString) ifFalse: [
		self reportFailureOf: #regexString atPos: skipPos.
		^ nil].
	
	^ PEGNode
		newOn: #_terminal
		for: string
		from: skipPos
		to: skipPos + 1
		children: \{char asString\}' format: {regexString}