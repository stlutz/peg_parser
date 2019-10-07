as yet unclassified
doEval: string at: pos
	| char |
	char := string at: pos ifAbsent: [^ {nil . PEGParsingError new: pos with: self}].
	^ (startChar <= char and: [char <= endChar])
		ifTrue: [{
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos + 1;
				yourself .
			nil}]
		ifFalse: [{nil . PEGParsingError new: pos with: self}]