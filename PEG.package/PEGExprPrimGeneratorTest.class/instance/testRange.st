as yet unclassified
testRange
	| rangeGenerator applyGenerator parser parseString parseResult |
	rangeGenerator := PEGExprRangeGenerator new: 'rule_1' from: $4 to: $9.
	applyGenerator := PEGExprApplyGenerator new: 'rule' child: 'rule_1'.
	
	rangeGenerator compileInto: parserClass.
	applyGenerator compileInto: parserClass.

	parser := parserClass new.
	
	parseString := '123456789abc'.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 5.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 8}.
	self assert: parseResult startPos equals: 8.
	self assert: parseResult endPos equals: 9.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 9}.
	self assert: parseResult startPos equals: 9.
	self assert: parseResult endPos equals: 10.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 10}.
	self assert: parseResult equals: nil