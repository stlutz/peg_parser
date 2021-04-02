method body generation
methodBodyTemplateWith: childCount
	| choiceCode postCode code |
	choiceCode := '(self {1}: pos) ifNotNil: [:childResult |
		^ PEGShadowNode
			newOn: #shadow
			for: string
			from: pos
			to: childResult endPos
			children: childResult nodeList].'.
	postCode := '^ nil'.

	code := '' , Character lf , Character lf.
	1 to: childCount do: [:index | code := code , (choiceCode format: {'{' , index , '}'}) , Character lf , Character lf].
	code := code , postCode.
	
	^ code