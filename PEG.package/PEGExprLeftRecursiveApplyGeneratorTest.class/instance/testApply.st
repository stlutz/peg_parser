as yet unclassified
testApply
	"
	a = b | c | '_'
	b = a 'b'
	c = a 'c'
	"
	| applyAGenerator applyBGenerator applyCGenerator aGenerator bGenerator cGenerator parser parseString parseResult |
	applyAGenerator := PEGExprLeftRecursiveApplyGenerator newWithRule: #a.
	applyBGenerator := PEGExprLeftRecursiveApplyGenerator newWithRule: #b.
	applyCGenerator := PEGExprLeftRecursiveApplyGenerator newWithRule: #c.
	
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

	applyAGenerator compile: #apply_a into: parserClass.
	applyBGenerator compile: #apply_b into: parserClass.
	applyCGenerator compile: #apply_c into: parserClass.
	
	aGenerator	compile: #parse_a into: parserClass.
	bGenerator compile: #parse_b into: parserClass.
	cGenerator compile: #parse_c into: parserClass.

	parser := parserClass new.
	parseString := '_bccb'.
	
	parseResult := parser parse: parseString startingFrom: #a
