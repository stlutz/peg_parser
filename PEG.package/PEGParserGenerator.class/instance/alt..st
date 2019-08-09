as yet unclassified
alt: anExprGeneratorList
	anExprGeneratorList do: [:generator | self checkExprGenerator: generator].
	^ PEGExprAlternativesGenerator new: anExprGeneratorList