as yet unclassified
methodMockWith: childCount
	| headerCode choiceCode footerCode code |
	headerCode := 'parse{1}: string atPos: pos
	| childResult |'.
	choiceCode := 'childResult := self parse{1}: string atPos: pos.
	childResult
		ifNotNil: [
			^ PEGShadowAbstractSyntaxTreeNode new
				rule: #alternatives;
				startPos: pos;
				endPos: childResult endPos;
				children: (Array with: childResult);
				yourself].'.
	footerCode := '^ nil'.

	code := headerCode , Character linefeed.
	1 to: childCount do: [:index | code := code , (choiceCode format: {'{' , (index + 1) , '}'}) , Character linefeed].
	code := code , footerCode.
	
	^ code