as yet unclassified
star: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprZeroOrMoreGenerator new: anExprGenerator.