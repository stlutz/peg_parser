as yet unclassified
doEval: string at: pos
	childExpr
		ifNil: [self error]
		ifNotNil: [
			| result |
			result := childExpr eval: string at: pos.
			^ result
				ifNotNil: [
					PEGAbstractSyntaxTreeNode new
						rule: self;
						startPos: result startPos;
						endPos: result endPos;
						children: result nodeList;
						identifier: identifier;
						yourself]
				ifNil: [nil]]