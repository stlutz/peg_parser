as yet unclassified
methodBodyMock
	^ '| childResult |
	childResult := self {1}: pos.
	^ childResult
		ifNil: [
			PEGShadowNode newOn: #shadow from: pos to: pos children: OrderedCollection new]
		ifNotNil: [
			self reportFailureOf: #not atPos: pos.
			nil]'