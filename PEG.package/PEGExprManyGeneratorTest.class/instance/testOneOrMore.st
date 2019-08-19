as yet unclassified
testOneOrMore
	| rangeGenerator oneOrMoreGenerator parser parseString parseResult |
	rangeGenerator := PEGExprRangeGenerator newFrom: $0 to: $9.
	oneOrMoreGenerator := PEGExprOneOrMoreGenerator new: rangeGenerator.
	
	oneOrMoreGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
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
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 5}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 7}.
	self assert: parseResult startPos equals: 7.
	self assert: parseResult endPos equals: 13.
	