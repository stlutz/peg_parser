as yet unclassified
run: string withClass: aClass
	| messageTally result |
	messageTally := MessageTally new.
	messageTally spyEvery: 1 on: [
		result := parser parse: string class: aClass].
	^ self class generateParsingResult: result string: string time: messageTally tally