runner
run: string withClass: aClass
	| messageTally result |
	messageTally := MessageTally new.
	messageTally spyEvery: 1 on: [
		result := self parse: string].
	^ self class generateParsingResult: result string: string time: messageTally tally