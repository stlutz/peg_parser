method body generation
methodBodyTemplate
	^ '| childResult |
	childResult := self {1}: pos.
	^ childResult
		ifNil: [
			PEGShadowNode newOn: #shadow for: string from: pos to: pos children: OrderedCollection new]
		ifNotNil: [
			self reportFailureOf: #not atPos: pos.
			nil]'