as yet unclassified
doEval: string at: pos
	| result |
	result := childExpr eval: string at: pos.
	^ result
		ifNil: [
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos;
				children: {};
				yourself]
		ifNotNil: [
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: result endPos;
				children: result nodeList;
				yourself]