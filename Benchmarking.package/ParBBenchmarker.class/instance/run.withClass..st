runner
run: string withClass: aClass
	| time result |	
	time := [result := self parse: string] timeToRunWithoutGC.
	^ self class generateParsingResult: result string: string time: time.