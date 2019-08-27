as yet unclassified
testZeroOrMore
	| rangeGenerator zeroOrMoreGenerator parser parseString parseResult |
	rangeGenerator := PEGExprRangeGenerator newFrom: $0 to: $9.
	zeroOrMoreGenerator := PEGExprLexicalZeroOrMoreGenerator new: rangeGenerator.
	
	zeroOrMoreGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parser rightmostFailure: (PEGParserFailure newAt: 0).
	parseString := '123abc123456'.
	
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult startPos equals: 2.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 3}.
	self assert: parseResult startPos equals: 3.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 5}.
	self assert: parseResult startPos equals: 5.
	self assert: parseResult endPos equals: 5.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 7}.
	self assert: parseResult startPos equals: 7.
	self assert: parseResult endPos equals: 13.
	