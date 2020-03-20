expressions
synstar: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprSyntacticalZeroOrMoreGenerator new: anExprGenerator.