as yet unclassified
doEval: string at: pos
	| result |
	childExprs do: [:childExpr |
		result := childExpr eval: string at: pos.
		result > 0 ifTrue: [^ result]].
	^ -1