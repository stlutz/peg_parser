as yet unclassified
synseq: anExprGeneratorList
	anExprGeneratorList do: [:generator | self checkExprGenerator: generator].
	^ PEGExprSyntacticalSequenceGenerator new: anExprGeneratorList