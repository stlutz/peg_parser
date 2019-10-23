as yet unclassified
methodBodyMock
	^ '| childResult |
	childResult := self {1}: pos.
	^ childResult
		ifNil: [nil]
		ifNotNil: [
			PEGShadowNode newOn: #lookahead from: pos to: pos children: childResult nodeList]'