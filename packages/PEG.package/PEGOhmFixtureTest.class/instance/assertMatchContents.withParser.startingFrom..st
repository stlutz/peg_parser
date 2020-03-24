assertions
assertMatchContents: cases withParser: parser startingFrom: startRule
	cases do: [:case |
		| input expect streamAtEnd result |
		input := case input.
		expect := case expect.
		streamAtEnd := case at: 'streamAtEnd' ifAbsent: [true].
		
		streamAtEnd
			ifTrue: [result := parser parse: input startingFrom: startRule]
			ifFalse: [result := parser partialParse: input startingFrom: startRule].
		self assert: expect equals: result succeeded]