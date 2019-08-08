as yet unclassified
testSequence
	" rule = [A-z] ([A-z] | [0-9] | '_')* ':' 
	[A-z] .. rule_1
	([A-z] | [0-9] | '_')*  .. rule_2	
	':' .. rule_3"
	| parser parseString parseResult |
	
	(PEGExprRangeGenerator new: 'rule_1' from: $A to: $z) compileInto: parserClass.
	(PEGExprRangeGenerator new: 'rule_2_1_1' from: $A to: $z) compileInto: parserClass.
	(PEGExprRangeGenerator new: 'rule_2_1_2' from: $0 to: $9) compileInto: parserClass.
	(PEGExprStringGenerator new: 'rule_2_1_3' with: '_') compileInto: parserClass.
	(PEGExprAlternativesGenerator new: 'rule_2_1' children: {'rule_2_1_1' . 'rule_2_1_2' . 'rule_2_1_3'}) compileInto: parserClass.
	(PEGExprZeroOrMoreGenerator new: 'rule_2' child: 'rule_2_1') compileInto: parserClass.
	(PEGExprStringGenerator new: 'rule_3' with: ':') compileInto: parserClass.
	(PEGExprSequenceGenerator new: 'rule' children: {'rule_1' . 'rule_2' . 'rule_3'}) compileInto: parserClass.
	
	parser := parserClass new.
	parseString := 'test test: 123 123: Test: test_2123abc: 1'. "word positions: 1 6 12 16 21 27 41"
	
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 6}.
	self assert: parseResult startPos equals: 6.
	self assert: parseResult endPos equals: 11.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 12}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 16}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 21}.
	self assert: parseResult startPos equals: 21.
	self assert: parseResult endPos equals: 26.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 27}.
	self assert: parseResult startPos equals: 27.
	self assert: parseResult endPos equals: 40.
	parseResult := parser perform: #parserule:atPos: withArguments: {parseString . 41}.
	self assert: parseResult equals: nil.