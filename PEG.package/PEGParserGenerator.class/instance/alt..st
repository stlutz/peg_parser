expressions
alt: anExprGeneratorList
	anExprGeneratorList do: [:generator | self checkExprGenerator: generator].
	^ PEGExprAlternativesGenerator new: anExprGeneratorList