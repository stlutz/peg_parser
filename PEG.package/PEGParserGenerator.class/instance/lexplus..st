as yet unclassified
lexplus: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprLexicalOneOrMoreGenerator new: anExprGenerator.