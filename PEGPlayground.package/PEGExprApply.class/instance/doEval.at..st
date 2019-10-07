as yet unclassified
doEval: string at: pos
	lastStringIdentityHash == string identityHash
		ifFalse: [
			lastStringIdentityHash := string identityHash.
			self initialize].

	^ memo at: pos ifAbsentPut: [
		| result childNode rightmostError |
		result := childExpr eval: string at: pos.
		childNode := result at: 1.
		rightmostError := result at: 2.
		childNode
			ifNotNil: [{
				PEGAbstractSyntaxTreeNode new
					rule: self;
					startPos: childNode startPos;
					endPos: childNode endPos;
					children: childNode nodeList;
					identifier: identifier;
					yourself .
				rightmostError}]
			ifNil: [{nil . rightmostError}]]