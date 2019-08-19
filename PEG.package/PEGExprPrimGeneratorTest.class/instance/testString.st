as yet unclassified
testString
	| stringGenerator parser parseString parseResult |
	stringGenerator := PEGExprStringGenerator newString: 'matchstring'.
	
	stringGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parseString := '123matchstring'.
	
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 15.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 5}.
	self assert: parseResult equals: nil