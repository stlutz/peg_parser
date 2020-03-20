expressions
lexstar: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprLexicalZeroOrMoreGenerator new: anExprGenerator.