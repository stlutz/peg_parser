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
				children: {};
				yourself]
		ifFalse: [
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: result endPos;
				children: {result};
				yourself]