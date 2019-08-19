as yet unclassified
testRange
	| rangeGenerator parser parseString parseResult |
	rangeGenerator := PEGExprRangeGenerator newFrom: $4 to: $9.
	
	rangeGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parseString := '123456789abc'.
	
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 5.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 8}.
	self assert: parseResult startPos equals: 8.
	self assert: parseResult endPos equals: 9.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 9}.
	self assert: parseResult startPos equals: 9.
	self assert: parseResult endPos equals: 10.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 10}.
	self assert: parseResult equals: nil