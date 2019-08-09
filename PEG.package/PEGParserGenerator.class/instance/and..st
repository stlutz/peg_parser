as yet unclassified
and: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprLookaheadGenerator new: anExprGenerator.