runner
run: string withClass: aClass
	| time result |	
	time := [result := parser parse: string class: aClass] timeToRunWithoutGC.
	^ self class generateParsingResult: result string: string time: time.