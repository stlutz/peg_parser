expressions
lexseq: anExprGeneratorList
	anExprGeneratorList do: [:generator | self checkExprGenerator: generator].
	^ PEGExprLexicalSequenceGenerator new: anExprGeneratorList