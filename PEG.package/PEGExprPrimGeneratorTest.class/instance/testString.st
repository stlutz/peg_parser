as yet unclassified
testString
	| stringGenerator applyGenerator parser parseString parseResult |
	stringGenerator := PEGExprStringGenerator new: 'rule_1' with: 'matchstring'.
	applyGenerator := PEGExprApplyGenerator new: 'rule' child: 'rule_1'.
	
	stringGenerator compileInto: parserClass.
	applyGenerator compileInto: parserClass.

	parser := parserClass new.
	
	parseString := '123matchstring'.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 15.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 5}.
	self assert: parseResult equals: nil