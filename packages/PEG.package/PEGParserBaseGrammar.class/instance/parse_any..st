as yet unclassified
parse_any: t1 
	^ t1 <= string size
		ifTrue: [PEGNode
				newOn: #'_terminal'
				for: string
				from: t1
				to: t1 + 1
				children: {string at: t1}]
		ifFalse: [self reportFailureOf: #any atPos: t1.
			nil]