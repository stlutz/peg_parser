as yet unclassified
synstar: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprSyntacticalZeroOrMoreGenerator new: anExprGenerator.