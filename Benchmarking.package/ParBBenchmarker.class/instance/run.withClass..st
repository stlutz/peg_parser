runner
run: string withClass: aClass
	| startTime endTime result |
	startTime := Time utcMicrosecondClock.
	result := self parse: string.
	endTime := Time utcMicrosecondClock.
	^ self class generateParsingResult: result string: string time: (endTime - startTime) / 1000