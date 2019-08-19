as yet unclassified
testAny
	| anyGenerator parser parseString parseResult |
	anyGenerator := PEGExprAnyGenerator new.
	
	anyGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parser rightmostFailure: (PEGParserFailure newAt: 0).
	parseString := 'a'.
	
	parseResult := parser parse_rule: parseString atPos: 1.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 2.
	parseResult := parser parse_rule: parseString atPos: 2.
	self assert: parseResult equals: nil