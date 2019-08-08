as yet unclassified
testOptional
	| stringGenerator optionalGenerator parser parseString parseResult |
	stringGenerator := PEGExprStringGenerator newString: 'matchstring'.
	optionalGenerator := PEGExprOptionalGenerator new: stringGenerator.
	
	optionalGenerator compile: #rule into: parserClass.
	parser := parserClass new.
	parseString := '123matchstring'.
	
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 1.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 2}.
	self assert: parseResult startPos equals: 2.
	self assert: parseResult endPos equals: 2.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 4}.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 15.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 5}.
	self assert: parseResult startPos equals: 5.
	self assert: parseResult endPos equals: 5.