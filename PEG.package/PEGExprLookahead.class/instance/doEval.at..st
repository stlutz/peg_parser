as yet unclassified
doEval: string at: pos
	| result |
	result := childExpr eval: string at: pos.
	^ result == nil
		ifTrue: [nil]
		ifFalse: [
			| children |
			children := LinkedList new.
			children add: result.
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos;
				children: children;
				yourself]