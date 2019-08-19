as yet unclassified
methodBodyMock
	^ '#matchString withIndexDo: [:character :index |
		(character == (string at: (pos + index - 1) ifAbsent: [nil])) ifFalse: [
			self reportFailureOf: #string at: pos.
			^ nil] ].
	^ PEGAbstractSyntaxTreeNode new
			rule: #string;
			startPos: pos;
			endPos: (pos + #matchString size);
			yourself'