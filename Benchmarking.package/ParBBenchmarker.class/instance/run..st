runner
run: string
	| timestamp1 timestamp2 result |
	timestamp1 := Time current.
	result := self parse: string.
	timestamp2 := Time current.
	
	^ self class generateParsingResult: result string: string startTime: timestamp1 endTime: timestamp2.