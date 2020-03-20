assertions
assertMatchTree: cases withParser: parser startingFrom: startRule
	cases do: [:case |
		| input expectedTree result |
		input := case at: 'input'.
		expectedTree := case at: 'expectedTree'.
		result := parser parse: input startingFrom: startRule.
		self assertMatchTreeNode: result cst toDict: expectedTree ]