as yet unclassified
methodMock
	^ 'parse{1}: string atPos: pos
	#matchString withIndexDo: [:character :index |
		(character == (string at: (pos + index - 1) ifAbsent: [nil])) ifFalse: [^ nil]].
	^ PEGAbstractSyntaxTreeNode new
			rule: #string;
			startPos: pos;
			endPos: (pos + #matchString size);
			yourself'