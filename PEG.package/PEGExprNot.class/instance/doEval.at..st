as yet unclassified
doEval: string at: pos
	| result |
	result := childExpr eval: string at: pos.
	^ result
		ifNil: [
			PEGShadowAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos;
				children: {};
				yourself]
		ifNotNil: [nil]