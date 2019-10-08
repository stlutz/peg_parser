expressions
synplus: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprSyntacticalOneOrMoreGenerator new: anExprGenerator.