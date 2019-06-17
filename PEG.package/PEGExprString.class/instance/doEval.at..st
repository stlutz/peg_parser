as yet unclassified
doEval: string at: pos
	matchString withIndexDo: [:character :index |
		(character == (string at: (pos + index - 1) ifAbsent: [nil])) ifFalse: [^ nil]].
	^ PEGAbstractSyntaxTreeNode new
		rule: self;
		startPos: pos;
		endPos: (pos + matchString size);
		yourself