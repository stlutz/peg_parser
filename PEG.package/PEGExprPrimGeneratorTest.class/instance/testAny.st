as yet unclassified
testAny
	| anyGenerator applyGenerator parser parseString parseResult |
	anyGenerator := PEGExprAnyGenerator new: 'rule_1'.
	applyGenerator := PEGExprApplyGenerator new: 'rule' child: 'rule_1'.
	
	anyGenerator compileInto: parserClass.
	applyGenerator compileInto: parserClass.

	parser := parserClass new.
	
	parseString := 'a'.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 1}.
	
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 2.
	
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult equals: nil