as yet unclassified
methodBodyMock
	^ '| childResult |
	childResult := self {1}: pos.
	^ childResult
		ifNil: [nil]
		ifNotNil: [
			PEGShadowNode newOn: #lookahead for: string from: pos to: pos children: childResult nodeList]'