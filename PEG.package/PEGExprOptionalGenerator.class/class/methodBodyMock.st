as yet unclassified
methodBodyMock
	^ '| childResult |
	childResult := self {1}: pos.
	^ childResult
		ifNil: [
			PEGAbstractSyntaxTreeNode new
				rule: #optional;
				startPos: pos;
				endPos: pos;
				children: OrderedCollection new;
				yourself]
		ifNotNil: [
			PEGAbstractSyntaxTreeNode new
				rule: #optional;
				startPos: pos;
				endPos: childResult endPos;
				children: childResult nodeList;
				yourself]'