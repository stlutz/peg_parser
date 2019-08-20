as yet unclassified
methodBodyMockWith: childCount
	| preCode choiceCode postCode code |
	preCode := '| childResult |'.
	choiceCode := 'childResult := self {1}: string atPos: pos.
	childResult
		ifNotNil: [
			^ PEGShadowAbstractSyntaxTreeNode new
				rule: #alternatives;
				startPos: pos;
				endPos: childResult endPos;
				children: childResult nodeList;
				yourself].'.
	postCode := '^ nil'.

	code := preCode , Character lf , Character lf.
	1 to: childCount do: [:index | code := code , (choiceCode format: {'{' , index , '}'}) , Character lf , Character lf].
	code := code , postCode.
	
	^ code