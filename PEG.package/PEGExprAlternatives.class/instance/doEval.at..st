as yet unclassified
doEval: string at: pos
	| result |
	childExprs do: [:childExpr |
		result := childExpr eval: string at: pos.
		result ifNotNil: [
			^ PEGShadowAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: result endPos;
				children: result nodeList;
				yourself]].
	^ nil