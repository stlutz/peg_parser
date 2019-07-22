as yet unclassified
doEval: string at: pos
	lastStringIdentityHash == string identityHash
		ifFalse: [
			lastStringIdentityHash := string identityHash.
			self initialize].

	^ memo at: pos ifAbsentPut: [
		| result |
		result := childExpr eval: string at: pos.
		result
			ifNotNil: [
				PEGAbstractSyntaxTreeNode new
					rule: self;
					startPos: result startPos;
					endPos: result endPos;
					children: result nodeList;
					identifier: identifier;
					yourself]
			ifNil: [nil]]