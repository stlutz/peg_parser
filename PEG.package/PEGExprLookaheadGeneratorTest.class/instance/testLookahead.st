as yet unclassified
testLookahead
	| stringGenerator lookaheadGenerator applyGenerator parser parseString parseResult |
	stringGenerator := PEGExprStringGenerator new: 'rule_1_1' with: 'matchstring'.
	lookaheadGenerator := PEGExprLookaheadGenerator new: 'rule_1' child: 'rule_1_1'.
	applyGenerator := PEGExprApplyGenerator new: 'rule' child: 'rule_1'.
	
	stringGenerator compileInto: parserClass.
	lookaheadGenerator compileInto: parserClass.
	applyGenerator compileInto: parserClass.

	parser := parserClass new.
	
	parseString := '123matchstring'.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 4.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 5}.
	self assert: parseResult equals: nil.