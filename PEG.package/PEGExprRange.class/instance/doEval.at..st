as yet unclassified
doEval: string at: pos
	| char |
	char := string at: pos.
	(startChar <= char and: [char <= endChar]) ifTrue: [^ pos + 1].
	^ -1