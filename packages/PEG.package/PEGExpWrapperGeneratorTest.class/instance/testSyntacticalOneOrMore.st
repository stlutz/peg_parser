tests
testSyntacticalOneOrMore
	"
	identifier := ([a-z] | [A-Z]) ([a-z] | [A-Z] | [0-9])*
	String := identifier+
	"

	| spacesGenerator identifierGenerator stringGenerator parser parseResult |
	
	spacesGenerator := PEGExprLexicalZeroOrMoreGenerator new: (PEGExprRangeGenerator newFrom: Character null to: Character space).
	identifierGenerator := PEGExprLexicalSequenceGenerator new: {
		PEGExprAlternativesGenerator new: {
			PEGExprRangeGenerator newFrom: $a to: $z .
			PEGExprRangeGenerator newFrom: $A to: $Z } .
		PEGExprLexicalZeroOrMoreGenerator new: (PEGExprAlternativesGenerator new: {
			PEGExprRangeGenerator newFrom: $a to: $z .
			PEGExprRangeGenerator newFrom: $A to: $Z .
			PEGExprRangeGenerator newFrom:	$0 to: $9 })}.
	stringGenerator := PEGExprSyntacticalOneOrMoreGenerator new: (PEGExprLexicalApplyWrapperGenerator newWithRule: #identifier).
	
	spacesGenerator compile: #parse_spaces into: parserClass.
	identifierGenerator compile: #parse_identifier into: parserClass.
	stringGenerator compile: #parse_String into: parserClass.
	
	(PEGExprApplyGenerator newWithRule: #spaces) compile: #apply_spaces into: parserClass.
	(PEGExprApplyGenerator newWithRule: #identifier) compile: #apply_identifier into: parserClass.
	(PEGExprApplyGenerator newWithRule: #String) compile: #apply_String into: parserClass.
	
	parser := parserClass new.
	
	parseResult := parser parse: 'test123' startingFrom: #String.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: '    test123' startingFrom: #String.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: 'TEST123' startingFrom: #String.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: ' test123 ' startingFrom: #String.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: '' , Character tab , 'test123' , Character enter startingFrom: #String.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: 'test123 abc abc ABC123' startingFrom: #String.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: '   test123    abc abc               ABC123     ' startingFrom: #String.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	parseResult := parser parse: '', Character tab , Character enter, 'test123', Character enter , 'ABC ' startingFrom: #String.
	self assert: (parseResult isMemberOf: PEGMatchResult).
	
	parseResult := parser parse: 'test123 abc abc 1ABC123' startingFrom: #String.
	self assert: (parseResult isMemberOf: PEGFailedMatchResult).
	parseResult := parser parse: 'test123 abc abc' , Character tab , '1ABC123' startingFrom: #String.
	self assert: (parseResult isMemberOf: PEGFailedMatchResult).