as yet unclassified
methodBodyMock
	^ '| childResult |
	childResult := self {1}: pos.
	^ childResult
		ifNil: [
			PEGNode newOn: #_terminal from: pos to: pos children: OrderedCollection new]
		ifNotNil: [
			PEGShadowNode newOn: #optional from: pos to: childResult endPos children: childResult nodeList]'