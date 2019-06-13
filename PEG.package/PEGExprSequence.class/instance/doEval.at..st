as yet unclassified
doEval: string at: pos
	| currentPos |
	currentPos := pos.
	childExprs do: [:childExpr |
		currentPos := childExpr eval: string at: currentPos.
		currentPos > 0 ifFalse: [^ -1]].
	^ currentPos