as yet unclassified
methodBodyMock
	^ '| childResult |
	childResult := self {1}: pos.
	^ childResult
		ifNil: [
			PEGNode newOn: #optional from: pos to: pos children: OrderedCollection new]
		ifNotNil: [
			PEGNode newOn: #optional from: pos to: childResult endPos children: childResult nodeList]'