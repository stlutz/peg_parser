as yet unclassified
synplus: anExprGenerator
	self checkExprGenerator: anExprGenerator.
	^ PEGExprSyntacticalOneOrMoreGenerator new: anExprGenerator.