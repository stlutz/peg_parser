as yet unclassified
doEval: string at: pos
	^ childExpr == nil
		ifTrue: [self error]
		ifFalse: [childExpr doEval: string at: pos]