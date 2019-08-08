as yet unclassified
testAny
	| anyGenerator parser parseString parseResult |
	anyGenerator := PEGExprAnyGenerator new.
	
	anyGenerator compile: #rule into: parserClass.
	parser := parserClass new.
	parseString := 'a'.
	
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 2.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult equals: nil