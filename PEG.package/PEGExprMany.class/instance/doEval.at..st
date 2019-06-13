as yet unclassified
doEval: string at: pos
	| resultList currentPos |
	resultList := LinkedList new.
	currentPos := pos.
	[currentPos > 0] whileTrue: [
		currentPos := childExpr eval: string at: currentPos.
		currentPos > 0 ifTrue: [resultList add: currentPos]].
	resultList size >= min ifTrue: [^ resultList last].
	^ -1