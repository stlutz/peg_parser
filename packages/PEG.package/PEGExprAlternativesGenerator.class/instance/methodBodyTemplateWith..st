method body generation
methodBodyTemplateWith: childCount
	| preCode choiceCode postCode code |
	preCode := '| childResult |'.
	choiceCode := 'childResult := self {1}: pos.
	childResult
		ifNotNil: [
			^ PEGShadowNode newOn: #shadow for: string from: pos to: childResult endPos children: childResult nodeList].'.
	postCode := '^ nil'.

	code := preCode , Character lf , Character lf.
	1 to: childCount do: [:index | code := code , (choiceCode format: {'{' , index , '}'}) , Character lf , Character lf].
	code := code , postCode.
	
	^ code