as yet unclassified
doEval: string at: pos
	(pos <= (string size)) ifTrue: [^ pos + 1].
	^ -1