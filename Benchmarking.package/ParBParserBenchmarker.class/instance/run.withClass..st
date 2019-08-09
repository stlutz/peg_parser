as yet unclassified
run: string withClass: aClass
	| startTime endTime result |
	startTime := Time utcMicrosecondClock.
	result := parser parse: string class: aClass.
	endTime := Time utcMicrosecondClock.
	^ self class generateParsingResult: result string: string time: (endTime - startTime) / 1000
