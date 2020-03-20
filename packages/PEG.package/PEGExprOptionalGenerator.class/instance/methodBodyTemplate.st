method body generation
methodBodyTemplate
	^ '| childResult |
	childResult := self {1}: pos.
	^ childResult
		ifNil: [
			PEGNode newOn: #_terminal for: string from: pos to: pos children: OrderedCollection new]
		ifNotNil: [
			PEGShadowNode newOn: #optional for: string from: pos to: childResult endPos children: childResult nodeList]'