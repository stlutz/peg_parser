assertions
assertMatchInterval: cases withParser: parser startingFrom: startRule
	cases do: [:case |
		| input expectedIntervals result |
		input := case input.
		expectedIntervals := case expectInterval.
		
		expectedIntervals ifNotNil: [
			expectedIntervals do: [:expectedInterval | 	
				result := parser partialParse: input startingFrom: startRule.
				self assert: result cst startPos equals: expectedInterval first.
				self assert: result cst endPos equals: expectedInterval second]]]