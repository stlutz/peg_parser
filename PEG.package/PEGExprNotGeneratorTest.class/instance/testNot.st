as yet unclassified
testNot
	| stringGenerator notGenerator applyGenerator parser parseString parseResult |
	stringGenerator := PEGExprStringGenerator new: 'rule_1_1' with: 'matchstring'.
	notGenerator := PEGExprNotGenerator new: 'rule_1' child: 'rule_1_1'.
	applyGenerator := PEGExprApplyGenerator new: 'rule' child: 'rule_1'.
	
	stringGenerator compileInto: parserClass.
	notGenerator compileInto: parserClass.
	applyGenerator compileInto: parserClass.

	parser := parserClass new.
	
	parseString := '123matchstring'.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 1.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult startPos equals: 2.
	self assert: parseResult endPos equals: 2.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 5}.
	self assert: parseResult startPos equals: 5.
	self assert: parseResult endPos equals: 5.