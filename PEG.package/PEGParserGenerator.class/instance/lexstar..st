as yet unclassified
lexstar: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprLexicalZeroOrMoreGenerator new: anExprGenerator.