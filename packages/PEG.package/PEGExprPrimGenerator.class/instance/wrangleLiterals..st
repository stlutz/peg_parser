evaluation
wrangleLiterals: aMethod

	1 to: aMethod numLiterals do: [:index | | literal |
		literal := aMethod objectAt: index + 1.
		(literalDict includesKey: literal) ifTrue: [
			aMethod objectAt: index + 1 put: (literalDict at: literal)]]