expressions
opt: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprOptionalGenerator new: anExprGenerator.