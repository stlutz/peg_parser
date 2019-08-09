as yet unclassified
plus: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprOneOrMoreGenerator new: anExprGenerator.