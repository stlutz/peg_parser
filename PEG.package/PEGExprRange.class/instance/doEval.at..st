as yet unclassified
doEval: string at: pos
	| char |
	char := string at: pos ifAbsent: [^ nil].
	^ (startChar <= char and: [char <= endChar])
		ifTrue: [
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos + 1;
				yourself]
		ifFalse: [nil]