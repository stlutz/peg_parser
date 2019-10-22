testing
testSynacticalSequence
	"
	a := b c d
	b := 'abc'
	c := [0-9]*
	d := 'x'
	"
	| spacesGenerator aGenerator bGenerator cGenerator dGenerator parser parseResult |
	spacesGenerator := PEGExprLexicalZeroOrMoreGenerator new: (PEGExprRangeGenerator newFrom: Character null to: Character space).
	aGenerator := PEGExprSyntacticalSequenceGenerator new: {
		PEGExprLexicalApplyWrapperGenerator newWithRule: #b .
		PEGExprLexicalApplyWrapperGenerator newWithRule: #c .
		PEGExprLexicalApplyWrapperGenerator newWithRule: #d }.
	bGenerator := PEGExprStringGenerator newString: 'abc'.
	cGenerator := PEGExprLexicalZeroOrMoreGenerator new: (PEGExprRangeGenerator newFrom: $0 to: $9).
	dGenerator := PEGExprStringGenerator newString: 'x'.
	
	spacesGenerator compile: #parse_spaces into: parserClass.
	aGenerator compile: #parse_a into: parserClass.
	bGenerator compile: #parse_b into: parserClass.
	cGenerator compile: #parse_c into: parserClass.
	dGenerator compile: #parse_d into: parserClass.
	
	(PEGExprApplyGenerator newWithRule: #spaces) compile: #apply_spaces into: parserClass.
	(PEGExprApplyGenerator newWithRule: #a) compile: #apply_a into: parserClass.
	(PEGExprApplyGenerator newWithRule: #b) compile: #apply_b into: parserClass.
	(PEGExprApplyGenerator newWithRule: #c) compile: #apply_c into: parserClass.
	(PEGExprApplyGenerator newWithRule: #d) compile: #apply_d into: parserClass.
	
	parser := parserClass new.
	
	parseResult := parser parse: 'abcx' startingFrom: #a.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: 'abc12390x' startingFrom: #a.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: 'abc      x   ' startingFrom: #a.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: 'abc 1 x ' startingFrom: #a.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: 'abcx  ' startingFrom: #a.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: 'abc' , Character tab , Character enter, '1x  ' startingFrom: #a.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: 'abcx  ', Character tab startingFrom: #a.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: 'abc123' , Character enter , 'x  ' startingFrom: #a.
	self assert: (parseResult isMemberOf: PEGMatchResult).
