as yet unclassified
doEval: string at: pos
	| result childNode |
	result := childExpr eval: string at: pos.
	childNode := result at: 1.
	^ childNode
		ifNil: [{
			PEGShadowAbstractSyntaxTreeNode new
				rule: self;
				startPos: pos;
				endPos: pos;
				children: {};
				yourself .
			nil}]
		ifNotNil: [{nil . PEGParsingError new: pos with: self}]