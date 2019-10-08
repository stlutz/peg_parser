expressions
lexplus: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprLexicalOneOrMoreGenerator new: anExprGenerator.