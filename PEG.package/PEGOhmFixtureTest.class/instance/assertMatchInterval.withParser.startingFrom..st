as yet unclassified
assertMatchInterval: cases withParser: parser startingFrom: startRule
	cases do: [:case |
		| input expectInterval result |
		input := case at: 'input'.
		expectInterval := case at: 'expectInterval'.
		
		result := parser partialParse: input startingFrom: startRule.
		self assert: result cst startPos equals: (expectInterval at: 1).
		self assert: result cst endPos equals: (expectInterval at: 2) ]