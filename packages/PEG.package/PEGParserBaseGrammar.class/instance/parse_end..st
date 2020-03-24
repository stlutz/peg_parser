as yet unclassified
parse_end: t1 
	| t2 |
	t2 := self parse_end_1: t1.
	^ t2
		ifNil: [PEGShadowNode
				newOn: #shadow
				for: string
				from: t1
				to: t1
				children: OrderedCollection new]
		ifNotNil: [self reportFailureOf: #not atPos: t1.
			nil]