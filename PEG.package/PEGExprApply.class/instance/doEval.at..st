as yet unclassified
doEval: string at: pos
	childExpr == nil
		ifTrue: [self error]
		ifFalse: [
			| result |
			result := childExpr doEval: string at: pos.
			^ result == nil
				ifTrue: [nil]
				ifFalse: [
					| children |
					children := LinkedList new.
					children add: result.
					PEGAbstractSyntaxTreeNode new
						rule: self;
						startPos: result startPos;
						endPos: result endPos;
						children: children;
						identifier: identifier;
						yourself]]