as yet unclassified
doEval: string at: pos
	matchString withIndexDo: [:index :character |
		(character = string at: (pos + index - 1)) ifFalse: [^ -1]].
	^ pos + matchString size