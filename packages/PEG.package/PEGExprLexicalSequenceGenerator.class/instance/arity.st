arity
arity

	^ (self childGenerators collect: [:child | child arity])
		ifEmpty: [0] 
		ifNotEmptyDo: [:arities |arities sum]