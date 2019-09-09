as yet unclassified
testApply
	"
	A = 'matchstring'
	B = [0-9]
	C = 'test'
	"
	| applyAGenerator applyBGenerator applyCGenerator aGenerator bGenerator cGenerator parser parseString parseResult |
	applyAGenerator := PEGExprApplyGenerator newWithRule: #A.
	applyBGenerator := PEGExprApplyGenerator newWithRule: #B.
	applyCGenerator := PEGExprApplyGenerator newWithRule: #C.
	
	aGenerator := PEGExprStringGenerator newString: 'matchstring'.
	bGenerator := PEGExprRangeGenerator newFrom: $0 to: $9.
	cGenerator := PEGExprStringGenerator newString: 'test'.

	applyAGenerator compile: #apply_A into: parserClass.
	applyBGenerator compile: #apply_B into: parserClass.
	applyCGenerator compile: #apply_C into: parserClass.
	
	aGenerator	compile: #parse_A into: parserClass.
	bGenerator compile: #parse_B into: parserClass.
	cGenerator compile: #parse_C into: parserClass.

	parser := parserClass new.
	parser rightmostFailure: (PEGParserFailure newAt: 0).
	parseString := '123matchstring'.
	
	parseResult := parser perform: #parse_A:atPos: withArguments: {parseString . 1}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_A:atPos: withArguments: {parseString . 4}.
	self assert: parseResult startPos equals: 4.
	self assert: parseResult endPos equals: 15.
	
	parseResult := parser perform: #parse_B:atPos: withArguments: {parseString . 1}.
	self assert: parseResult startPos equals: 1.
	self assert: parseResult endPos equals: 2.
	parseResult := parser perform: #parse_B:atPos: withArguments: {parseString . 4}.
	self assert: parseResult equals: nil.
	
	parseResult := parser perform: #parse_C:atPos: withArguments: {parseString . 1}.
	self assert: parseResult equals: nil.
	parseResult := parser perform: #parse_C:atPos: withArguments: {parseString . 4}.
	self assert: parseResult equals: nil.