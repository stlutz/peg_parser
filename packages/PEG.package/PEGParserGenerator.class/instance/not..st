expressions
not: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprNotGenerator new: anExprGenerator.