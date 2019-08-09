as yet unclassified
seq: anExprGeneratorList
	anExprGeneratorList do: [:generator | self checkExprGenerator: generator].
	^ PEGExprSequenceGenerator new: anExprGeneratorList