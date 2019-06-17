as yet unclassified
doEval: string at: pos
	| result |
	result := childExpr eval: string at: pos.
	^ result == nil
		ifTrue: [
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos;
				yourself]
		ifFalse: [nil]