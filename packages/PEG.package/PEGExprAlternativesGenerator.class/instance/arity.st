arity
arity

	^ self childGenerators
		ifEmpty: [0]
		ifNotEmptyDo: [:children | children first arity] 