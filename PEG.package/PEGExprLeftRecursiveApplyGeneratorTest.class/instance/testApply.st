as yet unclassified
testApply
	"
	a = b | c | '_'
	b = a 'b'
	c = a 'c'
	"
	| applySpacesGenerator applyAGenerator applyBGenerator applyCGenerator
	spacesGenerator aGenerator bGenerator cGenerator
	parser parseString parseResult |
	
	applySpacesGenerator := PEGExprApplyGenerator newWithRule: #spaces.
	applyAGenerator := PEGExprLeftRecursiveApplyGenerator newWithRule: #a.
	applyBGenerator := PEGExprLeftRecursiveApplyGenerator newWithRule: #b.
	applyCGenerator := PEGExprLeftRecursiveApplyGenerator newWithRule: #c.
	
	spacesGenerator := PEGExprLexicalZeroOrMoreGenerator new: (PEGExprStringGenerator newString: ' ').
	
	aGenerator := PEGExprAlternativesGenerator new: {
		PEGExprLexicalApplyWrapperGenerator newWithRule: #b .
		PEGExprLexicalApplyWrapperGenerator newWithRule: #c .
		PEGExprStringGenerator newString: '_'}.
	
	bGenerator := PEGExprLexicalSequenceGenerator new: {
		PEGExprLexicalApplyWrapperGenerator newWithRule: #a .
		PEGExprStringGenerator newString: 'b'}.

	cGenerator := PEGExprLexicalSequenceGenerator new: {
		PEGExprLexicalApplyWrapperGenerator newWithRule: #a .
		PEGExprStringGenerator newString: 'c'}.

	applySpacesGenerator compile: #apply_spaces into: parserClass.
	applyAGenerator compile: #apply_a into: parserClass.
	applyBGenerator compile: #apply_b into: parserClass.
	applyCGenerator compile: #apply_c into: parserClass.
	
	spacesGenerator compile: #parse_spaces into: parserClass.
	aGenerator	compile: #parse_a into: parserClass.
	bGenerator compile: #parse_b into: parserClass.
	cGenerator compile: #parse_c into: parserClass.

	parser := parserClass new.

	parseString := '_bccb'.
	parseResult := parser parse: parseString startingFrom: #a.
	self assert: parseResult cst endPos equals: 6.

	parseString := '_bccbcc'.
	parseResult := parser parse: parseString startingFrom: #a.
	self assert: parseResult cst endPos equals: 8.
	
	parseString := '_cb'.	
	parseResult := parser parse: parseString startingFrom: #a.
	self assert: parseResult cst endPos equals: 4.

	parseString := 'c_cb'.	
	parseResult := parser parse: parseString startingFrom: #a.
	self assert: parseResult failed.