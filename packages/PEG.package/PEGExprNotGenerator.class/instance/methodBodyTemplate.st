method body generation
methodBodyTemplate
	^ '(self {1}: pos) ifNotNil: [
		self reportFailureOf: #not atPos: pos.
		^ nil].
	^ PEGShadowNode
		newOn: #shadow
		for: string
		from: pos
		to: pos
		children: #()'