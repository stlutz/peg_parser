as yet unclassified
not: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprNotGenerator new: anExprGenerator.