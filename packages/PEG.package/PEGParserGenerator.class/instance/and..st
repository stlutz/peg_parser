expressions
and: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprLookaheadGenerator new: anExprGenerator.