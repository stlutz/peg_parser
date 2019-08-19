as yet unclassified
testNot
	| stringGenerator notGenerator parser parseString parseResult |
	
	stringGenerator := PEGExprStringGenerator newString: 'matchstring'.
	notGenerator := PEGExprNotGenerator new: stringGenerator.

	notGenerator compile: #parse_rule into: parserClass.

	parser := parserClass new.
	parser rightmostFailure: (PEGParserFailure newAt: 0).
	
	parseString := '123matchstring'.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 1.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult startPos equals: 2.
	self assert: parseResult endPos equals: 2.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 5}.
	self assert: parseResult startPos equals: 5.
	self assert: parseResult endPos equals: 5.