as yet unclassified
opt: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprOptionalGenerator new: anExprGenerator.