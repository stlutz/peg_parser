as yet unclassified
doEval: string at: pos
	| result |
	childExprs do: [:childExpr |
		result := childExpr eval: string at: pos.
		result == nil ifFalse: [
			| children |
			children := LinkedList new.
			children add: result.
			^ PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: result endPos;
				children: children;
				yourself]].
	^ nil