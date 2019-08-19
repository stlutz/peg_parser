as yet unclassified
testSequence
	" rule = [A-z] ([A-z] | [0-9] | '_')* ':' 
	[A-z] .. rule_1
	([A-z] | [0-9] | '_')*  .. rule_2	
	':' .. rule_3"
	| sequenceGenerator parser parseString parseResult |
	
	sequenceGenerator := PEGExprSequenceGenerator new: {
		PEGExprRangeGenerator newFrom: $A to: $z .
		PEGExprZeroOrMoreGenerator new: (
			PEGExprAlternativesGenerator new: {
				PEGExprRangeGenerator newFrom: $A to: $z .
				PEGExprRangeGenerator newFrom: $0 to: $9 .
				PEGExprStringGenerator newString: '_' } ) .
		PEGExprStringGenerator newString: ':' }.
	
	sequenceGenerator compile: #parse_rule into: parserClass.
	parser := parserClass new.
	parseString := 'test test: 123 123: Test: test_2123abc: 1'. "word positions: 1 6 12 16 21 27 41"
	
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 1}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 6}.
	self assert: parseResult startPos equals: 6.
	self assert: parseResult endPos equals: 11.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 12}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 16}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 21}.
	self assert: parseResult startPos equals: 21.
	self assert: parseResult endPos equals: 26.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 27}.
	self assert: parseResult startPos equals: 27.
	self assert: parseResult endPos equals: 40.
	parseResult := parser perform: #parse_rule:atPos: withArguments: {parseString . 41}.
	self assert: parseResult equals: nil.