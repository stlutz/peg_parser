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
				children: LinkedList new;
				yourself]
		ifFalse: [
			| children |
			children := LinkedList new.
			children add: result.
			PEGAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: result endPos;
				children: children;
				yourself]