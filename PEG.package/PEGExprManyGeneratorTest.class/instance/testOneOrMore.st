as yet unclassified
testOneOrMore
	| rangeGenerator oneOrMoreGenerator applyGenerator parser parseString parseResult |
	rangeGenerator := PEGExprRangeGenerator new: 'rule_1_1' from: $0 to: $9.
	oneOrMoreGenerator := PEGExprOneOrMoreGenerator new: 'rule_1' child: 'rule_1_1'.
	applyGenerator := PEGExprApplyGenerator new: 'rule' child: 'rule_1'.
	
	rangeGenerator compileInto: parserClass.
	oneOrMoreGenerator compileInto: parserClass.
	applyGenerator compileInto: parserClass.

	parser := parserClass new.
	
	parseString := '123abc123456'.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult startPos equals: 2.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 3}.
	self assert: parseResult startPos equals: 3.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 5}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 7}.
	self assert: parseResult startPos equals: 7.
	self assert: parseResult endPos equals: 13.
	